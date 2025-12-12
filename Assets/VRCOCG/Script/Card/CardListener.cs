using System;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.UdonNetworkCalling;

namespace VRCOCG
{
    public class CardListener : UdonSharpBehaviour
    {
        public CardRegistry cardRegistry;
        // [NonSerialized] public Side side;
        // void Start()
        // {
        //     side = GetComponentInParent<Side>();
        // }

        [NetworkCallable]
        public void SyncCardMove(long timestamp, string uid, int code, Vector3 pos, Quaternion rot)
        {
            Debug.Log($"[CardManager] SyncCardMove: uid = {uid}, code = {code}, pos = {pos}, rot = {rot}");
            var card = cardRegistry.GetOrNew(uid, code);
            if (!card.timestamp.VerifyTimestamp(timestamp)) return;
            card.transform.SetPositionAndRotation(pos, rot);
        }

        [NetworkCallable]
        public void SyncCardRemove(long timestamp, string uid)
        {
            Debug.Log($"[CardManager] SyncCardRemove: uid = {uid}");
            var card = cardRegistry.TryGet(uid);
            if (card != null)
            {
                if (!card.timestamp.VerifyTimestamp(timestamp)) return;
                cardRegistry.Unregister(card);
            }
            else
            {
                Debug.LogWarning($"[CardManager] SyncCardRemove: Card {uid} not found");
            }
        }
    }
}