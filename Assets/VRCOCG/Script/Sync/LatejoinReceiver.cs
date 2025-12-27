using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDK3.UdonNetworkCalling;
using VRCOCG;

namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    public class LatejoinReceiver : UdonSharpBehaviour
    {
        private Syncer syncer;
        private DataDictionary sides;
        void Start()
        {
            syncer = GetComponentInParent<Syncer>();
            SendCustomEventDelayedFrames(nameof(DelayedStart), 1);
        }

        public void DelayedStart()
        {
            sides = new DataDictionary();
            for (int i = 0; i < syncer.sides.Length; i++)
            {
                var side = syncer.sides[i];
                sides[side.uid] = side;
            }
        }

        [NetworkCallable]
        public void SyncLatejoin(string json)
        {
            Debug.Log($"[LatejoinReceiver] SyncLatejoin: {json}");
            if(!VRCJson.TryDeserializeFromJson(json, out var dataToken))
            {
                Debug.LogError($"[LatejoinReceiver] Failed to deserialize JSON: {dataToken.Error}");
                return;
            }
            var data = dataToken.DataDictionary;
            var keys = data.GetKeys();
            for (int i = 0; i < keys.Count; i++)
            {
                var uid = keys[i];
                var side = (Side)sides[uid].Reference;
                var sideData = data[uid].DataDictionary;
                side.DeserializeAll(sideData);
            }
            SendCustomEventDelayedSeconds(nameof(SetReady), 10f);
        }

        public void SetReady()
        {
            syncer.ready = true;
        }
    }
}