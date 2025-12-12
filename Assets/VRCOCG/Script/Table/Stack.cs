
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDK3.UdonNetworkCalling;
using VRC.Udon.Common.Interfaces;

namespace VRCOCG
{
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
        private long timestamp = 0;

        void Start()
        {
            stackUX = GetComponentInChildren<StackUX>();
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
                if (!timestamp.VerifyTimestamp(newTimestamp)) return;
                cards = cardsToken.DataList;
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

        public void AddCard(int code, int pos)
        {
            if (pos == POS_BOTTOM)
            {
                cards.Shift(code);
            }
            else
            {
                cards.Add((double)code);
                if (pos == POS_RANDOM)
                {
                    cards.Shuffle();
                }
            }

            Sync();
        }

        public int DrawCard(int pos)
        {
            int code;
            if (cards.Count == 0) return -1;
            if (pos == POS_TOP)
            {
                code = cards.Pop().AsInt();
            }
            else if (pos == POS_BOTTOM)
            {
                code = cards.Unshift().AsInt();
            }
            else
            {
                var gen = new System.Random();
                var i = gen.Next(cards.Count);
                code = cards[i].AsInt();
                cards.RemoveAt(i);
            }

            Sync();
            return code;
        }

        public bool TryRemoveCard(int code)
        {
            var i = cards.IndexOf((double)code);
            if (i == -1) return false;
            cards.RemoveAt(i);
            if (type == HIDDEN)
            {
                cards.Shuffle();
            }
            Sync();
            return true;
        }

        private void Sync()
        {
            if (VRCJson.TrySerializeToJson(cards, JsonExportType.Minify, out DataToken data))
            {
                SendCustomNetworkEvent(NetworkEventTarget.Others, nameof(SyncEvent), DateTime.UtcNow.ToFileTimeUtc(), data.String);
            }
            else
            {
                // Impossible
                Debug.LogError($"Can't serialize: {data.Error}");
                timestamp = DateTime.UtcNow.ToFileTimeUtc();
                cards = new DataList();
            }
        }

        [NetworkCallable]
        public void SyncEvent(long newTimeStamp, string json)
        {
            if (VRCJson.TryDeserializeFromJson(json, out DataToken data))
            {
                if (!timestamp.VerifyTimestamp(newTimeStamp)) return;
                cards = data.DataList;
            }
            else
            {
                // Impossible
                Debug.LogError($"Can't deserialize: {data.Error}");
            }
        }
    }
}