using System;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.Udon.Common.Interfaces;

namespace VRCOCG
{
    public class Card : UdonSharpBehaviour
    {
        public CardUX cardUX;
        public string uid;
        public int code;
        private Material mat;
        public CardManager cardManager;
        public CardPool cardPool;
        public DataCenter dataCenter;
        public Side side;

        // public string cardName;
        // public string desc;
        // public string pdsec;

        // public uint type;
        // public uint race;
        // public uint attribute;
        // public int atk; // -2 is ?
        // public int def; // LINK
        // public int level; // or link arrows as bitmask
        // public int lscale;
        // public int rscale;
        private DataDictionary data;

        public long timestamp = DateTime.UtcNow.ToFileTimeUtc();

        // void Start()
        // {
        //     Thaw();
        // }

        // void OnDestroy()
        // {
        //     Freeze();
        // }

        public void SetCard(int c)
        {
            code = c;
            data = dataCenter.Get(code);
            if (data == null)
            {
                Debug.LogError($"[Card] Data not found for code {code}");
                return;
            }
            DataCenter.SetMaterial(mat, code, data);
        }

        // Move has been down, this is just a confirmation (send sync event)
        public void ConfirmMove()
        {
            var t = gameObject.transform;
            timestamp = DateTime.UtcNow.ToFileTimeUtc();
            cardManager.SendCustomNetworkEvent(NetworkEventTarget.Others, 
                nameof(CardManager.SyncCardMove), timestamp, uid, code, side.uid, t.position, t.rotation);
        }

        public void Remove()
        {
            // cardPool.Destroy(this);
            // There's a possibility that this gameobject is destroyed here
            // timestamp = DateTime.UtcNow.ToFileTimeUtc();
            cardManager.SendCustomNetworkEvent(NetworkEventTarget.All, 
                nameof(CardManager.SyncCardRemove), DateTime.UtcNow.ToFileTimeUtc(), uid);
        }

        public void Thaw()
        {
            // create a unique one
            mat = gameObject.GetComponentInChildren<Renderer>().material;
            var cardUX = gameObject.GetComponentInChildren<CardUX>();
            cardUX.Thaw();
        }

        public void Freeze()
        {
            if (mat != null && mat != GetComponentInChildren<Renderer>().sharedMaterial) // 
            {
                Destroy(mat);
            }
            mat = null;
        }
    }
}