using System;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.UdonNetworkCalling;
using VRC.SDKBase;

namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    public class CardListener : UdonSharpBehaviour
    {
        public CardRegistry cardRegistry;
        // [NonSerialized] public Side side;
        // void Start()
        // {
        //     side = GetComponentInParent<Side>();
        // }

        [NetworkCallable]
        public void SyncCardMove(long timestamp, string uid, double code, Vector3 pos, Quaternion rot)
        {
            Debug.Log($"[CardManager] SyncCardMove: uid={uid}, code={code}, pos={pos}, rot={rot}");
            var card = cardRegistry.GetOrNew(uid, code);
            if (!card.timestamp.VerifyTimestamp(timestamp, "CardListener > SyncCardMove")) return;
            card.transform.SetPositionAndRotation(pos, rot);
            card.cardUX.Uncollide();
        }

        [NetworkCallable]
        public void SyncCardRemove(long timestamp, string uid)
        {
            Debug.Log($"[CardManager] SyncCardRemove: uid={uid}");
            var card = cardRegistry.TryGet(uid);
            if (card != null)
            {
                if (!card.timestamp.VerifyTimestamp(timestamp, "CardListener > SyncCardRemove")) return;
                cardRegistry.Unregister(card);
            }
            else
            {
                Debug.LogWarning($"[CardManager] SyncCardRemove: Card {uid} not found");
            }
        }
    }
}