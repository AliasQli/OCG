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
        [NonSerialized] public DataList mainDeckCards = new DataList();
        [NonSerialized] public DataList extraDeckCards = new DataList();
        [NonSerialized] public DataList sideDeckCards = new DataList();
        private long timestamp = DateTime.UtcNow.ToFileTimeUtc();
        
        public CardRegistry cardRegistry;
        public CardListener cardListener;
        public Stack mainDeck;
        public Stack extraDeck;
        public Stack graveyard;
        public Stack banished;
        public Stack facedownBanished;

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
            graveyard.stackUX.ClosePanel();
            banished.stackUX.ClosePanel();
            facedownBanished.stackUX.ClosePanel();
            mainDeck.SetCards(mainDeckCards.DeepClone().Shuffle());
            extraDeck.SetCards(extraDeckCards.DeepClone().Shuffle());
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
            if (newTimeStamp <= timestamp) return;
            if (VRCJson.TryDeserializeFromJson(json, out DataToken data))
            {
                timestamp = newTimeStamp;
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