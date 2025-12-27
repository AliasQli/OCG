using System;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDK3.UdonNetworkCalling;

namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    public class CardRegistry : UdonSharpBehaviour
    {
        [NonSerialized] public DataDictionary dict = new DataDictionary();
        private CardPool pool;
        private Side side;
        private long timestamp = 0;

        void Start()
        {
            pool = GetComponentInParent<Table>().cardPool;
            side = GetComponentInParent<Side>();
        }

        public DataDictionary Serialize()
        {
            var cardsDict = new DataDictionary();
            var keys = dict.GetKeys();
            for (int i = 0; i < keys.Count; i++)
            {
                var key = keys[i];
                var card = (Card)dict[key].Reference;
                var cardData = new DataDictionary();
                cardData["ts"] = $"{card.timestamp}";
                cardData["uid"] = card.uid;
                cardData["code"] = card.code;
                card.transform.GetPositionAndRotation(out var pos, out var rot);
                cardData["posx"] = pos.x;
                cardData["posy"] = pos.y;
                cardData["posz"] = pos.z;
                cardData["rotx"] = rot.x;
                cardData["roty"] = rot.y;
                cardData["rotz"] = rot.z;
                cardData["rotw"] = rot.w;
                cardsDict[key] = cardData;
            }
            var data = new DataDictionary();
            data["ts"] = $"{timestamp}";
            data["cards"] = cardsDict;
            return data;
        }

        public void Deserialize(DataDictionary data)
        {
            if (data == null) return;
            if (data.TryGetValue("ts", TokenType.String, out DataToken tsToken) &&
                data.TryGetValue("cards", TokenType.DataDictionary, out DataToken cardsToken))
            {
                long newTimestamp = long.Parse(tsToken.String);
                if (!timestamp.VerifyTimestamp(newTimestamp, "CardRegistry > Deserialize")) return;

                var cardsDict = cardsToken.DataDictionary;
                var keys = cardsDict.GetKeys();
                for (int i = 0; i < keys.Count; i++)
                {
                    var key = keys[i].String;
                    var cardData = cardsDict[key].DataDictionary;
                    string uid = cardData["uid"].String;
                    double code = cardData["code"].Number;
                    long cardTs = long.Parse(cardData["ts"].String);
                    var card = GetOrNew(uid, code);
                    if (!card.timestamp.VerifyTimestamp(cardTs)) continue;
                    float posx = (float)cardData["posx"].Number;
                    float posy = (float)cardData["posy"].Number;
                    float posz = (float)cardData["posz"].Number;
                    float rotx = (float)cardData["rotx"].Number;
                    float roty = (float)cardData["roty"].Number;
                    float rotz = (float)cardData["rotz"].Number;
                    float rotw = (float)cardData["rotw"].Number;
                    card.transform.SetPositionAndRotation(
                        new Vector3(posx, posy, posz),
                        new Quaternion(rotx, roty, rotz, rotw));
                }

                keys = dict.GetKeys();
                for (int i = 0; i < keys.Count; i++)
                {
                    var key = keys[i].String;
                    if (!cardsDict.ContainsKey(key))
                    {
                        UnregisterByUid(key);
                    }
                }
            }
        }

        public Card GetOrNew(string uid, double code)
        {
            var card = TryGet(uid);
            if (card == null)
            {
                card = pool.New(code, uid, side);
                dict.Add(uid, card);
                timestamp = Helper.GetTimestamp();
            }
            return card;
        }

        public Card New(double code, int i = 0)
        {
            string uid = Helper.GenerateId(pool.prefab.name, i);
            var card = pool.New(code, uid, side);
            card.timestamp = Helper.GetTimestamp();
            dict.Add(uid, card);
            timestamp = Helper.GetTimestamp();
            return card;
        }

        public void Transfer(string uid, CardRegistry newRegistry)
        {
            var card = TryGet(uid);
            if (card != null)
            {
                dict.Remove(uid);
                newRegistry.dict.Add(uid, card);
                timestamp = Helper.GetTimestamp();
                newRegistry.timestamp = timestamp;
            }
            else
            {
                Debug.LogWarning($"[CardRegistry] Transfer: Card {uid} not found");
            }
        }

        public void Unregister(Card card)
        {
            if (dict.Remove(card.uid))
            {
                timestamp = Helper.GetTimestamp();
            }
            else
            {
                Debug.LogWarning($"[CardRegistry] Unregister: Card {card.uid} not found");
            }
            pool.Recycle(card);
        }

        public void UnregisterByUid(string uid)
        {
            if (dict.TryGetValue(uid, TokenType.Reference, out DataToken card))
            {
                dict.Remove(uid);
                pool.Recycle((Card)card.Reference);
                timestamp = Helper.GetTimestamp();
                return;
            }
            else
            {
                Debug.LogWarning($"[CardRegistry] UnregisterByUid: Card {uid} not found");
            }
        }

        public void UnregisterAll()
        {
            var cards = dict.GetValues();
            Debug.Log($"[CardRegistry] UnregisterAll (has {cards.Count})");
            for (int i = 0; i < cards.Count; i++)
            {
                Unregister((Card)cards[i].Reference);
            }
            dict = new DataDictionary();
        }

        public void ForceUnregisterAll(long newTimestamp)
        {
            timestamp = newTimestamp;
            UnregisterAll();
        }

        // [NetworkCallable]
        // public void ClearEvent(long newTimestamp)
        // {
        //     if (!timestamp.VerifyTimestamp(newTimestamp, "CardRegistry > ClearEvent")) return;
        //     UnregisterAll();
        // }

        // public void Load(long newTimestamp, string json)
        // {
        //     if (VRCJson.TryDeserializeFromJson(json, out var newDict))
        //     {
        //         if (!timestamp.VerifyTimestamp(newTimestamp, "CardRegistry > Load")) return;
        //         dict = newDict.DataDictionary;
        //         Debug.Log($"[CardRegistry] Load: Loaded {dict.Count} cards");
        //     }
        //     else
        //     {
        //         Debug.LogError("[CardRegistry] Load: Failed to deserialize JSON");
        //     }
        // }

        // Nullable
        public Card TryGet(string uid)
        {
            if (dict.TryGetValue(uid, TokenType.Reference, out DataToken obj))
            {
                return (Card)obj.Reference;
            }
            else
            {
                return null;
            }
        }
    }
}
