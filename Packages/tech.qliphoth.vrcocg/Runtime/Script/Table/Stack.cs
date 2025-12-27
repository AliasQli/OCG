
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDK3.UdonNetworkCalling;
using VRC.Udon.Common.Interfaces;

namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    public class Stack : UdonSharpBehaviour
    {
        [NonSerialized] public StackUX stackUX;
        public const int TYPE_OPEN = 0;
        public const int HIDDEN = 1;

        public int type;

        public const int POS_RANDOM = 0;
        public const int POS_TOP = 1;
        public const int POS_BOTTOM = 2;

        public int DefaultPosition()
        {
            if (type == HIDDEN)
            {
                return POS_RANDOM;
            }
            else
            {
                return POS_TOP;
            }
        }

        [NonSerialized] public DataList cards = new DataList();
        [NonSerialized] public string debugName;
        private long timestamp = 0;

        void Start()
        {
            stackUX = GetComponentInChildren<StackUX>();
            ChangeHeight();
        }

        public DataDictionary Serialize()
        {
            var data = new DataDictionary();
            data["ts"] = $"{timestamp}";
            data["cards"] = cards;
            return data;
        }

        public void Deserialize(DataDictionary data)
        {
            if (data == null) return;
            if (data.TryGetValue("ts", TokenType.String, out DataToken tsToken) &&
                data.TryGetValue("cards", TokenType.DataList, out DataToken cardsToken))
            {
                long newTimestamp = long.Parse(tsToken.String);
                if (!timestamp.VerifyTimestamp(newTimestamp, $"Stack({debugName}) > Deserialize")) return;
                cards = cardsToken.DataList;
                ChangeHeight(); // latejoin will have height 0
                stackUX.ClosePanel();
            }
        }

        public void ClearCards()
        {
            cards = new DataList();
            Sync();
        }

        public void SetCards(DataList c)
        {
            cards = c;
            Sync();
        }

        public void ForceSetCards(long newTimestamp, DataList c)
        {
            cards = c;
            timestamp = newTimestamp;
            ChangeHeight();
            stackUX.ClosePanel();
        }

        public void AddCard(double code, int pos)
        {
            if (pos == POS_BOTTOM)
            {
                cards.Shift(code);
            }
            else
            {
                cards.Add(code);
                if (pos == POS_RANDOM)
                {
                    cards.Shuffle();
                }
            }

            Sync();
        }

        public double DrawCard(int pos)
        {
            double code;
            if (cards.Count == 0) return -1;
            if (pos == POS_TOP)
            {
                code = cards.Pop().Number;
            }
            else if (pos == POS_BOTTOM)
            {
                code = cards.Unshift().Number;
            }
            else
            {
                var gen = new System.Random();
                var i = gen.Next(cards.Count);
                code = cards[i].Number;
                cards.RemoveAt(i);
            }

            Sync();
            return code;
        }

        public bool TryRemoveCard(double code)
        {
            var i = cards.IndexOf(code);
            if (i == -1) return false;
            cards.RemoveAt(i);
            if (type == HIDDEN)
            {
                cards.Shuffle();
            }
            Sync();
            return true;
        }

        private void ChangeHeight()
        {
            var h = cards.Count / 60f + 1e-4f;
            stackUX.transform.localScale = new Vector3(1, h, 1);
        }

        private void Sync()
        {
            timestamp = Helper.GetTimestamp();
            if (!VRCJson.TrySerializeToJson(Serialize(), JsonExportType.Minify, out DataToken data))
            {
                Debug.LogError($"[Stack] Can't serialize: {data.Error}");
                return;
            }
            SendCustomNetworkEvent(NetworkEventTarget.Others, nameof(SyncEvent), data.String);
            ChangeHeight();
            stackUX.ClosePanel();
        }

        [NetworkCallable]
        public void SyncEvent(string json)
        {
            if (!VRCJson.TryDeserializeFromJson(json, out DataToken data))
            {
                Debug.LogError($"[Stack] Can't deserialize: {data.Error}");
                return;
            }
            Deserialize(data.DataDictionary);
        }
    }
}