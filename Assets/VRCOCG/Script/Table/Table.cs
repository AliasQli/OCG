
using UdonSharp;
using UnityEngine;
using VRC.SDK3.UdonNetworkCalling;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Common.Interfaces;


namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    public class Table : UdonSharpBehaviour
    {
        public CardPool cardPool;
        public string uid;
        Side[] sides;
        SlotUX[] slotUXs;

        void Start()
        {
            sides = GetComponentsInChildren<Side>();
            slotUXs = GetComponentsInChildren<SlotUX>();
        }

        public void Reset()
        {
            for (int i = 0; i < sides.Length; i++)
            {
                var side = sides[i];
                side.Init();
            }
            SendCustomNetworkEvent(NetworkEventTarget.All, nameof(ResetSlotUXEvent));
        }

        [NetworkCallable]
        public void ResetSlotUXEvent() // TODO: reentrant
        {
            for (int i = 0; i < slotUXs.Length; i++)
            {
                var slotUX = slotUXs[i];
                slotUX.Clear();
            }
        }
    }
}