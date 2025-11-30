using UdonSharp;
using UnityEngine;
using VRC.SDK3.UdonNetworkCalling;

namespace VRCOCG
{
    public class CardManager : UdonSharpBehaviour
    {
        public CardPool cardPool;
        public Registry sideRegistry;
        void Start()
        {

        }

        [NetworkCallable]
        public void SyncCardMove(long timestamp, string uid, int code, string sideUid, Vector3 pos, Quaternion rot)
        {
            Debug.Log($"[CardManager] SyncCardMove {uid} {code} {sideUid} {pos} {rot}");
            var side = (Side)sideRegistry.TryGet(sideUid);
            var card = cardPool.Get(uid, code, side);
            if (card.timestamp < timestamp)
            {
                card.timestamp = timestamp;
                card.transform.SetPositionAndRotation(pos, rot);
            }
        }

        [NetworkCallable]
        public void SyncCardRemove(long timestamp, string uid)
        {
            Debug.Log($"[CardManager] SyncCardRemove {uid}");
            var card = cardPool.TryGet(uid);
            if (card != null)
            {
                if (card.timestamp < timestamp)
                {
                    cardPool.Destroy(card);
                }
            }
            else
            {
                Debug.LogWarning($"[CardManager] SyncCardRemove: Card {uid} not found");
            }
        }
    }
}