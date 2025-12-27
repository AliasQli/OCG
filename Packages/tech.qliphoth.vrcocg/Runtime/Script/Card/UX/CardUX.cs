using System;
using System.Diagnostics.CodeAnalysis;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;

namespace VRCOCG
{
    [RequireComponent(typeof(VRC_Pickup))]
    [RequireComponent(typeof(Collider))]
    [UdonBehaviourSyncMode(BehaviourSyncMode.None)]
    public class CardUX : UdonSharpBehaviour
    {
        [NotNull] public Card card;
        [NonSerialized] public Stack fromStack = null;
        [NonSerialized] public StackInserterUX collidingStackInserter = null;
        [NonSerialized] public SlotUX collidingSlotUX = null;

        public void Init()
        {
            fromStack = null;
            collidingStackInserter = null;
            collidingSlotUX = null;
            VRC_Pickup pickup = GetComponent<VRC_Pickup>();
            pickup.UseText = "Sync";
            // pickup.AutoHold = VRC_Pickup.AutoHoldMode.Sometimes;
        }

        public void Uncollide()
        {
            if (collidingStackInserter != null)
            {
                collidingStackInserter.Uncollide();
                collidingStackInserter = null;
            }
            if (collidingSlotUX != null)
            {
                collidingSlotUX.Uncollide();
                collidingSlotUX = null;
            }
        }

        public void Uninit()
        {
            Uncollide();
            fromStack = null;
        }

        void OnTriggerEnter([NotNull] Collider other)
        {
            Debug.Log("[CardUX] OnTriggerEnter");
            if (collidingStackInserter != null || collidingSlotUX != null) return;
            var stackInserterUX = other.GetComponent<StackInserterUX>();
            if (stackInserterUX != null && stackInserterUX.side == card.side)
            {
                collidingStackInserter = stackInserterUX;
                stackInserterUX.Collide();
                return;
            }
            var slotUX = other.GetComponent<SlotUX>();
            if (slotUX != null && slotUX.table == card.side.table)
            {
                collidingSlotUX = slotUX;
                slotUX.Collide();
                return;
            }
        }

        void OnTriggerExit([NotNull] Collider other)
        {
            Debug.Log("[CardUX] OnTriggerExit");
            if (collidingStackInserter == null && collidingSlotUX == null) return;
            var stackInserterUX = other.GetComponent<StackInserterUX>();
            if (stackInserterUX != null && stackInserterUX == collidingStackInserter)
            {
                collidingStackInserter = null;
                stackInserterUX.Uncollide();
                return;
            }
            var slotUX = other.GetComponent<SlotUX>();
            if (slotUX != null && slotUX == collidingSlotUX)
            {
                collidingSlotUX = null;
                slotUX.Uncollide();
                return; 
            }
        }

        public override void OnPickup()
        {
            if (fromStack != null)
            {
                fromStack.stackUX.ClosePanel(card);
            }
        }

        public override void OnDrop()
        {
            Debug.Log($"[CardUX] Dropped card: uid={card.uid}, code={card.code}, colliding={collidingStackInserter}, from={fromStack}");
            if (collidingStackInserter != null)
            {
                if (fromStack == null || collidingStackInserter.stack != fromStack && fromStack.TryRemoveCard(card.code))
                {
                    collidingStackInserter.stack.AddCard(card.code, collidingStackInserter.position);
                }
                // collidingStackInserter.Uncollide(); // Unnessary?
                // fromStack = null;

                // card.Remove();
                if (fromStack != null)
                {
                    // local card
                    card.side.cardRegistry.Unregister(card);
                }
                else
                {
                    card.Remove();
                }
            }
            else
            {
                if (fromStack != null && !fromStack.TryRemoveCard(card.code))
                {
                    // Card cannot be instantiated (card is local)
                    // card.Remove();
                    card.side.cardRegistry.Unregister(card);
                }
                else
                {
                    if (collidingSlotUX != null)
                    {
                        collidingSlotUX.PlaceCard(this);
                        collidingSlotUX.Uncollide();
                        collidingSlotUX = null;
                    }
                    card.ConfirmMove();
                    fromStack = null;
                }
            }
        }

        public override void OnPickupUseDown()
        {
            if (fromStack == null)
            {
                card.ConfirmMove();
            }
        }
    }
}