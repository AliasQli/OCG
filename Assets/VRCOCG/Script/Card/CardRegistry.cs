using System;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDK3.UdonNetworkCalling;

namespace VRCOCG
{
    public class CardRegistry : UdonSharpBehaviour
    {
        [NonSerialized] public DataDictionary dict = new DataDictionary();
        private CardPool pool;
        private long timestamp = DateTime.UtcNow.ToFileTimeUtc();

        void Start()
        {
            pool = GetComponentInParent<Table>().cardPool;
        }

        public Card GetOrNew(string uid, int code, Side side)
        {
            var card = TryGet(uid);
            if (card == null)
            {
                card = pool.New(code, side);
                dict.Add(uid, card);
                timestamp = DateTime.UtcNow.ToFileTimeUtc();
            }
            return card;
        }

        public Card New(int code, Side side)
        {
            string uid = Helper.GenerateId(pool.prefab.name);
            var card = pool.New(code, side);
            card.uid = uid;
            dict.Add(uid, card);
            timestamp = DateTime.UtcNow.ToFileTimeUtc();
            return card;
        }

        public void Unregister(Card card)
        {
            if (!dict.Remove(card.uid))
            {
                Debug.LogWarning($"[CardRegistry] Unregister: Card {card.uid} not found");
                timestamp = DateTime.UtcNow.ToFileTimeUtc();
            }
            pool.Recycle(card);
        }
        public void UnregisterByUid(string uid)
        {
            if (dict.TryGetValue(uid, TokenType.Reference, out DataToken card))
            {
                dict.Remove(uid);
                pool.Recycle((Card)card.Reference);
                timestamp = DateTime.UtcNow.ToFileTimeUtc();
                return;
            }
            else
            {
                Debug.LogWarning($"[CardRegistry] UnregisterByUid: Card {uid} not found");
            }
        }

        [NetworkCallable]
        public void UnregisterAll(long newTimestamp)
        {
            if (timestamp >= newTimestamp)
            {
                return;
            }
            timestamp = newTimestamp;
            var cards = dict.GetValues();
            Debug.Log($"[CardRegistry] UnregisterAll (has {cards.Count})");
            for (int i = 0; i < cards.Count; i++)
            {
                Unregister((Card)cards[i].Reference);
            }
            dict = new DataDictionary();
        }

        public void Load(string json, long newTimestamp)
        {
            if (timestamp >= newTimestamp) return;
            if (VRCJson.TryDeserializeFromJson(json, out var newDict))
            {
                dict = newDict.DataDictionary;
                timestamp = newTimestamp;
                Debug.Log($"[CardRegistry] Load: Loaded {dict.Count} cards");
            }
            else
            {
                Debug.LogError("[CardRegistry] Load: Failed to deserialize JSON");
            }
        }

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
