
using System;
using System.Diagnostics.CodeAnalysis;
using UdonSharp;
using UnityEngine;

namespace VRCOCG
{
    [RequireComponent(typeof(Renderer))]

    public class StackInserterUX : UdonSharpBehaviour
    {
        [NotNull] public Material collideMaterial;
        [NonSerialized, NotNull] public Material[] materials;
        [NonSerialized, NotNull] public Material[] collideMaterials;
        [NonSerialized, NotNull] public new Renderer renderer;
        [NotNull] public Stack stack;
        [NotNull] private Side side;
        public int position = -1;

        void Start()
        {
            side = GetComponentInParent<Side>();
            renderer = GetComponent<Renderer>();
            if (position == -1)
            {
                position = stack.DefaultPosition();
            }
            materials = renderer.materials;
            collideMaterials = new Material[materials.Length];
            for (int i = 0; i < materials.Length; i++)
            {
                collideMaterials[i] = collideMaterial;
            }
        }

        void OnTriggerEnter([NotNull] Collider other)
        {
            Debug.Log("[StackInserterUX] OnTriggerEnter");
            var cardUX = other.GetComponent<CardUX>();
            if (cardUX == null) return;
            if (cardUX.card.side != side) return;
            if (cardUX.collidingStackInserter != null) return;
            renderer.materials = collideMaterials;
            cardUX.collidingStackInserter = this;
        }

        void OnTriggerExit([NotNull] Collider other)
        {
            Debug.Log("[StackInserterUX] OnTriggerExit");
            var cardUX = other.GetComponent<CardUX>();
            if (cardUX == null) return;
            if (cardUX.card.side != side) return;
            if (cardUX.collidingStackInserter != this) return;
            renderer.materials = materials;
            cardUX.collidingStackInserter = null;
        }
    }
}