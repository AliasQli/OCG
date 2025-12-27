using System;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDK3.UdonNetworkCalling;
using VRC.Udon.Common.Interfaces;

namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    public class Board : UdonSharpBehaviour
    {
        [NonSerialized] public int lp = 8000;
        long timestamp = 0;
        BoardUX boardUX;

        void Start()
        {
            boardUX = GetComponentInChildren<BoardUX>();
            boardUX.UpdateLPText();
            boardUX.UpdatePlusSubstText();
        }

        public DataDictionary Serialize()
        {
            var data = new DataDictionary();
            data["ts"] = $"{timestamp}";
            data["lp"] = lp;
            return data;
        }

        public void Deserialize(DataDictionary data)
        {
            if (data == null) return;
            if (data.TryGetValue("ts", TokenType.String, out var tsToken) && 
                data.TryGetValue("lp", TokenType.Double, out var lpToken))
            {
                long newTimestamp = long.Parse(tsToken.String);
                if (!timestamp.VerifyTimestamp(newTimestamp, "Board > Deserialize")) return;
                lp = lpToken.AsInt();
            }
        }

        public void SetLP(int newLP)
        {
            lp = Math.Max(newLP, 0);
            Sync();
            boardUX.UpdateLPText();
        }

        public void ForceSetLP(long newTimestamp, int newLP)
        {
            lp = newLP;
            timestamp = newTimestamp;
            boardUX.UpdateLPText();
        }

        private void Sync()
        {
            timestamp = Helper.GetTimestamp();
            if (!VRCJson.TrySerializeToJson(Serialize(), JsonExportType.Minify, out DataToken data))
            {
                Debug.LogError($"[Side] Can't serialize: {data.Error}");
                return;
            }
            SendCustomNetworkEvent(NetworkEventTarget.Others, nameof(SyncEvent), data.String);
        }

        [NetworkCallable]
        public void SyncEvent(string json)
        {
            if (!VRCJson.TryDeserializeFromJson(json, out DataToken data))
            {
                Debug.LogError($"[Side] Can't deserialize: {data.Error}");
                return;
            }
            Deserialize(data.DataDictionary);
            boardUX.UpdateLPText();
        }
    }
}