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
                collidingStackInserter.renderer.material = collidingStackInserter.material;
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
            Debug.Log($"[CardUX] Dropped card {card.code}, {collidingStackInserter} {fromStack}");
            if (collidingStackInserter == null)
            {
                card.ConfirmMove();
                if (fromStack != null)
                {
                    fromStack.TryRemoveCard(card.code);
                    fromStack = null;
                }
                return;
            }
            if (collidingStackInserter.stack != fromStack)
            {
                if (fromStack != null)
                {
                    if (fromStack.TryRemoveCard(card.code))
                    {
                        collidingStackInserter.stack.AddCard(card.code, collidingStackInserter.position);
                    }
                }
                else
                {
                    collidingStackInserter.stack.AddCard(card.code, collidingStackInserter.position);
                }
            }
            fromStack = null;
            collidingStackInserter.renderer.material = collidingStackInserter.material;
            card.Remove();
        }
    }
}