
using System;
using System.Diagnostics.CodeAnalysis;
using UdonSharp;
using UnityEngine;

namespace VRCOCG
{
    [RequireComponent(typeof(Renderer))]
    [RequireComponent(typeof(Collider))]
    [UdonBehaviourSyncMode(BehaviourSyncMode.None)]

    public class StackInserterUX : UdonSharpBehaviour
    {
        [NotNull] public Material collideMaterial;
        [NonSerialized, NotNull] public Material[] materials;
        [NonSerialized, NotNull] public Material[] collideMaterials;
        [NonSerialized, NotNull] public new Renderer renderer;
        [NonSerialized, NotNull] public Stack stack;
        [NonSerialized, NotNull] public Side side;
        public int position = -1;

        void Start()
        {
            stack = GetComponentInParent<Stack>();
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

        public void Collide()
        {
            renderer.materials = collideMaterials;
        }

        public void Uncollide()
        {
            renderer.materials = materials;
        }
    }
}