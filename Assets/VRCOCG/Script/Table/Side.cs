
using System;
using System.CodeDom;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using UdonSharp;
using Unity.Mathematics;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDK3.UdonNetworkCalling;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Common.Interfaces;

namespace VRCOCG
{
    public class Side : UdonSharpBehaviour
    {
        [NonSerialized] public string uid;
        [NonSerialized] public DataList mainDeckCards = new DataList();
        [NonSerialized] public DataList extraDeckCards = new DataList();
        [NonSerialized] public DataList sideDeckCards = new DataList();
        private long timestamp = DateTime.UtcNow.ToFileTimeUtc();
        [NonSerialized] public CardPool cardPool;
        public Stack mainDeck;
        public Stack extraDeck;
        public Stack graveyard;
        public Stack banished;
        public Stack facedownBanished;
        [NonSerialized] public Quaternion cardRot;
        [NonSerialized] public DataList cards = new DataList();

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
            SendCustomNetworkEvent(NetworkEventTarget.All, nameof(WipeCardsEvent));
        }

        [NetworkCallable]
        public void WipeCardsEvent()
        {
            for (int i = 0; i < cards.Count; i++)
            {
                if (cards[i].Reference == null)
                {
                    Debug.LogWarning($"[Side] WipeCardsEvent: Card at index {i} is null");
                }
                cardPool.Destroy((Card)cards[i].Reference);
            }
            cards = new DataList();
        }

        void Start()
        {
            cardRot = Quaternion.Euler(90, 180, 0) * gameObject.transform.rotation;
            var table = gameObject.GetComponentInParent<Table>();
            uid = $"{table.uid}_{gameObject.name}";
            table.sideRegistry.Register(uid, this);
            cardPool = table.cardPool;
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