using System;
using System.Diagnostics.CodeAnalysis;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

namespace VRCOCG
{
    public class CardUX : UdonSharpBehaviour
    {
        [NotNull] public Card card;
        public Stack fromStack = null;
        public StackInserterUX collidingStackInserter = null;

        public void Thaw()
        {
            fromStack = null;
            collidingStackInserter = null;
        }

        public void Freeze()
        {
            if (collidingStackInserter != null)
            {
                collidingStackInserter.renderer.materials = collidingStackInserter.materials;
                collidingStackInserter = null;
            }
            fromStack = null;
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
            Debug.Log($"[CardUX] Dropped card: uid = {card.uid}, code = {card.code}, colliding = {collidingStackInserter}, from = {fromStack}");
            if (collidingStackInserter == null)
            {
                if (fromStack != null)
                {
                    if (fromStack.TryRemoveCard(card.code))
                    {
                        card.ConfirmMove();
                    }
                    else
                    {
                        card.Remove();
                    }
                    fromStack = null;
                }
                else
                {
                    card.ConfirmMove();
                }
            }
            else
            {
                if (fromStack != null)
                {
                    if (collidingStackInserter.stack != fromStack)
                    {
                        if (fromStack.TryRemoveCard(card.code))
                        {
                            collidingStackInserter.stack.AddCard(card.code, collidingStackInserter.position);
                        }
                    }
                    fromStack = null;
                }
                else
                {
                    collidingStackInserter.stack.AddCard(card.code, collidingStackInserter.position);
                }
                collidingStackInserter.renderer.materials = collidingStackInserter.materials;
                card.Remove();
            }
        }
    }
}