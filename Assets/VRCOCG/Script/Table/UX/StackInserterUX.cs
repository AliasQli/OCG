
using System;
using System.Diagnostics.CodeAnalysis;
using UdonSharp;
using UnityEngine;

namespace VRCOCG
{
    public class StackInserterUX : UdonSharpBehaviour
    {
        [NotNull] public Material material;
        [NotNull] public Material collideMaterial;
        [NonSerialized, NotNull] public new Renderer renderer;
        [NotNull] public Stack stack;
        [NotNull] private Side side;
        public int position = -1;

        void Start()
        {
            side = gameObject.GetComponentInParent<Side>();
            renderer = gameObject.GetComponent<Renderer>();
            if (position == -1)
            {
                position = stack.DefaultPosition();
            }
        }

        void OnTriggerEnter([NotNull] Collider other)
        {
            Debug.Log("[StackInserterUX] OnTriggerEnter");
            var cardUX = other.gameObject.GetComponent<CardUX>();
            if (cardUX == null) return;
            if (cardUX.card.side != side) return;
            if (cardUX.collidingStackInserter != null) return;
            renderer.material = collideMaterial;
            cardUX.collidingStackInserter = this;
        }

        void OnTriggerExit([NotNull] Collider other)
        {
            Debug.Log("[StackInserterUX] OnTriggerExit");
            var cardUX = other.gameObject.GetComponent<CardUX>();
            if (cardUX == null) return;
            if (cardUX.card.side != side) return;
            if (cardUX.collidingStackInserter != this) return;
            renderer.material = material;
            cardUX.collidingStackInserter = null;
        }
    }
}