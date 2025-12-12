using System;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDK3.UdonNetworkCalling;
using VRC.Udon.Common.Interfaces;

namespace VRCOCG
{
    public class Side : UdonSharpBehaviour
    {
        [NonSerialized] public string uid;
        public string sideName;
        [NonSerialized] public DataList mainDeckCards = new DataList();
        [NonSerialized] public DataList extraDeckCards = new DataList();
        [NonSerialized] public DataList sideDeckCards = new DataList();
        private long timestamp = 0;
        
        public CardRegistry cardRegistry;
        public CardListener cardListener;
        public Stack mainDeck;
        public Stack extraDeck;
        public Stack extraPendulumDeck;
        public Stack graveyard;
        public Stack banished;
        public Stack facedownBanished;
        [NonSerialized] public float scale;

        void Start()
        {
            scale = transform.lossyScale.x;
            uid = $"{GetComponentInParent<Table>().uid}_{sideName}";
        }

        public DataDictionary Serialize()
        {
            var data = new DataDictionary();
            data["ts"] = $"{timestamp}";
            data["mainDeckCards"] = mainDeckCards;
            data["extraDeckCards"] = extraDeckCards;
            data["sideDeckCards"] = sideDeckCards;
            data["mainDeck"] = mainDeck.Serialize();
            data["extraDeck"] = extraDeck.Serialize();
            data["extraPendulumDeck"] = extraPendulumDeck.Serialize();
            data["graveyard"] = graveyard.Serialize();
            data["banished"] = banished.Serialize();
            data["facedownBanished"] = facedownBanished.Serialize();
            data["cardRegistry"] = cardRegistry.Serialize();
            return data;
        }

        public void Deserialize(DataDictionary data)
        {
            if (data == null) return;
            if (data.TryGetValue("ts", TokenType.String, out DataToken tsToken) &&
                data.TryGetValue("mainDeckCards", TokenType.DataList, out DataToken mainDeckCardsToken) &&
                data.TryGetValue("extraDeckCards", TokenType.DataList, out DataToken extraDeckCardsToken) &&
                data.TryGetValue("sideDeckCards", TokenType.DataList, out DataToken sideDeckCardsToken) &&
                data.TryGetValue("mainDeck", TokenType.DataDictionary, out DataToken mainDeckToken) &&
                data.TryGetValue("extraDeck", TokenType.DataDictionary, out DataToken extraDeckToken) &&
                data.TryGetValue("extraPendulumDeck", TokenType.DataDictionary, out DataToken extraPendulumDeckToken) &&
                data.TryGetValue("graveyard", TokenType.DataDictionary, out DataToken graveyardToken) &&
                data.TryGetValue("banished", TokenType.DataDictionary, out DataToken banishedToken) &&
                data.TryGetValue("facedownBanished", TokenType.DataDictionary, out DataToken facedownBanishedToken) &&
                data.TryGetValue("cardRegistry", TokenType.DataDictionary, out DataToken cardRegistryToken))
            {
                mainDeck.Deserialize(mainDeckToken.DataDictionary);
                extraDeck.Deserialize(extraDeckToken.DataDictionary);
                extraPendulumDeck.Deserialize(extraPendulumDeckToken.DataDictionary);
                graveyard.Deserialize(graveyardToken.DataDictionary);
                banished.Deserialize(banishedToken.DataDictionary);
                facedownBanished.Deserialize(facedownBanishedToken.DataDictionary);
                cardRegistry.Deserialize(cardRegistryToken.DataDictionary);

                long newTimestamp = long.Parse(tsToken.String);
                if (!timestamp.VerifyTimestamp(newTimestamp)) return;
                mainDeckCards = mainDeckCardsToken.DataList;
                extraDeckCards = extraDeckCardsToken.DataList;
                sideDeckCards = sideDeckCardsToken.DataList;
            }
        }

        public void SetCards(DataList main, DataList extra, DataList side)
        {
            mainDeckCards = main;
            extraDeckCards = extra;
            sideDeckCards = side;
            Sync();
        }

        public void Init()
        {
            mainDeck.stackUX.ClosePanel();
            extraDeck.stackUX.ClosePanel();
            extraPendulumDeck.stackUX.ClosePanel();
            graveyard.stackUX.ClosePanel();
            banished.stackUX.ClosePanel();
            facedownBanished.stackUX.ClosePanel();
            mainDeck.SetCards(mainDeckCards.DeepClone().Shuffle());
            extraDeck.SetCards(extraDeckCards.DeepClone().Shuffle());
            extraPendulumDeck.ClearCards();
            graveyard.ClearCards();
            banished.ClearCards();
            facedownBanished.ClearCards();
            cardRegistry.SendCustomNetworkEvent(NetworkEventTarget.All, 
                nameof(CardRegistry.UnregisterAll), DateTime.UtcNow.ToFileTimeUtc());
        }

        private DataDictionary Pack()
        {
            DataDictionary d = new DataDictionary();
            d["main"] = mainDeckCards;
            d["extra"] = extraDeckCards;
            d["side"] = sideDeckCards;
            return d;
        }

        private void Unpack(DataDictionary d)
        {
            mainDeckCards = d["main"].DataList;
            extraDeckCards = d["extra"].DataList;
            sideDeckCards = d["side"].DataList;
        }

        private void Sync()
        {
            if (VRCJson.TrySerializeToJson(Pack(), JsonExportType.Minify, out DataToken data))
            {
                timestamp = DateTime.UtcNow.ToFileTimeUtc();
                SendCustomNetworkEvent(NetworkEventTarget.Others, nameof(SyncEvent), timestamp, data.String);
            }
            else
            {
                // Impossible
                Debug.LogError($"Can't serialize: {data.Error}");
            }
        }

        [NetworkCallable]
        public void SyncEvent(long newTimeStamp, string json)
        {
            if (VRCJson.TryDeserializeFromJson(json, out DataToken data))
            {
                if (!timestamp.VerifyTimestamp(newTimeStamp)) return;
                Unpack(data.DataDictionary);
            }
            else
            {
                // Impossible
                Debug.LogError($"Can't deserialize: {data.Error}");
            }
        }
    }
}