using System;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDK3.UdonNetworkCalling;
using VRC.SDKBase;
using VRC.Udon.Common.Interfaces;

namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    public class Side : UdonSharpBehaviour
    {
        [NonSerialized] public string uid;
        public string sideName;
        [NonSerialized] public DataList mainDeckCards = new DataList();
        [NonSerialized] public DataList extraDeckCards = new DataList();
        [NonSerialized] public DataList sideDeckCards = new DataList();
        [NonSerialized] public Board board;
        [NonSerialized] public Table table;
        [NonSerialized] public int ownerId = -1;
        private long timestamp = 0;
        
        public CardRegistry cardRegistry;
        public CardListener cardListener;
        public Stack mainDeck;
        public Stack extraDeck;
        public Stack extraPendulumDeck;
        public Stack graveyard;
        public Stack banished;
        public Stack facedownBanished;
        SideUX sideUX;
        [NonSerialized] public float scale;

        void Start()
        {
            scale = transform.lossyScale.x;
            uid = $"{GetComponentInParent<Table>().uid}_{sideName}";
            board = GetComponentInChildren<Board>();
            table = GetComponentInParent<Table>();
            sideUX = GetComponentInChildren<SideUX>();
            sideUX.UpdateOwnerId();
            mainDeck.debugName = "MainDeck";
            extraDeck.debugName = "ExtraDeck";
            extraPendulumDeck.debugName = "ExtraPendulumDeck";
            graveyard.debugName = "Graveyard";
            banished.debugName = "Banished";
            facedownBanished.debugName = "FacedownBanished";
        }

        private DataDictionary Serialize()
        {
            var data = new DataDictionary();
            data["ts"] = $"{timestamp}";
            data["mainDeckCards"] = mainDeckCards;
            data["extraDeckCards"] = extraDeckCards;
            data["sideDeckCards"] = sideDeckCards;
            data["ownerId"] = ownerId;
            return data;
        }

        private void Deserialize(DataDictionary d)
        {
            if (d == null) return;
            if (d.TryGetValue("ts", TokenType.String, out DataToken tsToken) &&
                d.TryGetValue("mainDeckCards", TokenType.DataList, out DataToken mainDeckCardsToken) &&
                d.TryGetValue("extraDeckCards", TokenType.DataList, out DataToken extraDeckCardsToken) &&
                d.TryGetValue("sideDeckCards", TokenType.DataList, out DataToken sideDeckCardsToken) &&
                d.TryGetValue("ownerId", TokenType.Double, out DataToken ownerIdToken))
            {
                long newTimestamp = long.Parse(tsToken.String);
                if (!timestamp.VerifyTimestamp(newTimestamp, $"Side({sideName}) > Deserialize")) return;
                mainDeckCards = mainDeckCardsToken.DataList;
                extraDeckCards = extraDeckCardsToken.DataList;
                sideDeckCards = sideDeckCardsToken.DataList;
                ownerId = ownerIdToken.AsInt();
            }
        }

        public DataDictionary SerializeAll()
        {
            var data = Serialize();
            data["mainDeck"] = mainDeck.Serialize();
            data["extraDeck"] = extraDeck.Serialize();
            data["extraPendulumDeck"] = extraPendulumDeck.Serialize();
            data["graveyard"] = graveyard.Serialize();
            data["banished"] = banished.Serialize();
            data["facedownBanished"] = facedownBanished.Serialize();
            data["cardRegistry"] = cardRegistry.Serialize();
            data["board"] = board.Serialize();
            return data;
        }

        public void DeserializeAll(DataDictionary data)
        {
            if (data == null) return;
            if (data.TryGetValue("mainDeck", TokenType.DataDictionary, out DataToken mainDeckToken) &&
                data.TryGetValue("extraDeck", TokenType.DataDictionary, out DataToken extraDeckToken) &&
                data.TryGetValue("extraPendulumDeck", TokenType.DataDictionary, out DataToken extraPendulumDeckToken) &&
                data.TryGetValue("graveyard", TokenType.DataDictionary, out DataToken graveyardToken) &&
                data.TryGetValue("banished", TokenType.DataDictionary, out DataToken banishedToken) &&
                data.TryGetValue("facedownBanished", TokenType.DataDictionary, out DataToken facedownBanishedToken) &&
                data.TryGetValue("cardRegistry", TokenType.DataDictionary, out DataToken cardRegistryToken) &&
                data.TryGetValue("board", TokenType.DataDictionary, out DataToken boardToken))
            {
                mainDeck.Deserialize(mainDeckToken.DataDictionary);
                extraDeck.Deserialize(extraDeckToken.DataDictionary);
                extraPendulumDeck.Deserialize(extraPendulumDeckToken.DataDictionary);
                graveyard.Deserialize(graveyardToken.DataDictionary);
                banished.Deserialize(banishedToken.DataDictionary);
                facedownBanished.Deserialize(facedownBanishedToken.DataDictionary);
                cardRegistry.Deserialize(cardRegistryToken.DataDictionary);
                board.Deserialize(boardToken.DataDictionary);

                Deserialize(data);
            }
        }

        public void Init()
        {
            DataDictionary data = new DataDictionary();
            data["ts"] = $"{Helper.GetTimestamp()}";
            data["main"] = mainDeckCards.DeepClone().Shuffle();
            data["extra"] = extraDeckCards.DeepClone().Shuffle();
            if (!VRCJson.TrySerializeToJson(data, JsonExportType.Minify, out DataToken token))
            {
                Debug.LogError($"[Side] Can't serialize Init data: {token.Error}");
                return;
            }
            SendCustomNetworkEvent(NetworkEventTarget.All, nameof(InitEvent), token.String);
        }

        [NetworkCallable]
        public void InitEvent(string json)
        {
            if (!VRCJson.TryDeserializeFromJson(json, out DataToken data))
            {
                Debug.LogError($"[Side] Can't deserialize Init data: {data.Error}");
                return;
            }
            long newTimestamp = long.Parse(data.DataDictionary["ts"].String);
            DataList mainDeckC = data.DataDictionary["main"].DataList;
            DataList extraDeckC = data.DataDictionary["extra"].DataList;
            if (!timestamp.VerifyTimestamp(newTimestamp, $"Side({sideName}) > InitEvent")) return;
            mainDeck.ForceSetCards(newTimestamp, mainDeckC);
            extraDeck.ForceSetCards(newTimestamp, extraDeckC);
            extraPendulumDeck.ForceSetCards(newTimestamp, new DataList());
            graveyard.ForceSetCards(newTimestamp, new DataList());
            banished.ForceSetCards(newTimestamp, new DataList());
            facedownBanished.ForceSetCards(newTimestamp, new DataList());
            cardRegistry.ForceUnregisterAll(newTimestamp);
            board.ForceSetLP(newTimestamp, 8000);
        }

        public void JoinAndSetCards(DataList main, DataList extra, DataList side)
        {
            ownerId = Networking.LocalPlayer.playerId;
            mainDeckCards = main;
            extraDeckCards = extra;
            sideDeckCards = side;
            Sync();
            sideUX.UpdateOwnerId();
        }

        public void Leave()
        {
            ownerId = -1;
            Sync();
            sideUX.UpdateOwnerId();
        }

        public override void OnPlayerLeft(VRCPlayerApi player)
        {
            if (ownerId != player.playerId) return;
            ownerId = -1;
            sideUX.UpdateOwnerId();
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
            sideUX.UpdateOwnerId();
        }
    }
}