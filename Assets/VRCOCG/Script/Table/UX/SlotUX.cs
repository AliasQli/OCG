
using System;
using System.Diagnostics.CodeAnalysis;
using UdonSharp;
using UnityEditor;
using UnityEngine;
using VRC.SDK3.UdonNetworkCalling;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Common.Interfaces;

namespace VRCOCG
{
    [RequireComponent(typeof(Renderer))]
    [RequireComponent(typeof(Collider))]
    [UdonBehaviourSyncMode(BehaviourSyncMode.None)]
    public class SlotUX : UdonSharpBehaviour
    {
        public bool isMonster = true;
        private int count = 0;
        [NonSerialized, NotNull] public Table table;
        [NotNull] public Material collideMaterial;
        [NonSerialized, NotNull] public Material material;
        [NonSerialized, NotNull] public new Renderer renderer;
        Quaternion rot;
        Vector3 pos;
        Vector3 up;
        Vector3 forward;

        void Start()
        {
            table = GetComponentInParent<Table>();
            renderer = GetComponent<Renderer>();
            material = renderer.material;
            pos = transform.position;
            rot = transform.rotation;
            up = rot * Vector3.up;
            forward = rot * Vector3.forward;
        }

        public void Collide()
        {
            renderer.material = collideMaterial;
        }

        public void Uncollide()
        {
            renderer.material = material;
        }

        public void Clear()
        {
            count = 0;
        }

        public void PlaceCard(CardUX cardUX)
        {
            Quaternion mulRot;
            var cardRot = cardUX.transform.rotation;
            bool facingUp = Vector3.Dot(cardRot * Vector3.up, up) >= 0f;
            bool facingForward = Vector3.Dot(cardRot * Vector3.forward, forward) >= 0f;
            Debug.Log($"[SlotUX] PlaceCard up={up} forward={forward} cardUp={cardRot * Vector3.up} cardForward={cardRot * Vector3.forward} facingUp={facingUp} facingForward={facingForward}");
            if (isMonster)
            {
                if (facingUp)
                {
                    cardRot.ToAngleAxis(out float angle, out var axis);
                    angle %= 180f;
                    if (angle <= 45 || angle >= 135f)
                    {
                        if (facingForward)
                        {
                            mulRot = Quaternion.identity;
                        }
                        else
                        {
                            mulRot = Quaternion.Euler(new Vector3(0, 180, 0));
                        }
                    }
                    else
                    {
                        mulRot = Quaternion.Euler(new Vector3(0, -90, 0));
                    }
                }
                else
                {
                    mulRot = Quaternion.Euler(new Vector3(0, -90, 180));
                }
            }
            else
            {
                if (facingUp)
                {
                    if (facingForward)
                    {
                        mulRot = Quaternion.identity;
                    }
                    else
                    {
                        mulRot = Quaternion.Euler(new Vector3(0, 180, 0));
                    }
                }
                else
                {
                    mulRot = Quaternion.Euler(new Vector3(0, 0, 180));
                }
            }
            cardUX.transform.SetPositionAndRotation(GetPos(), mulRot * rot);
        }

        Vector3 GetPos()
        {
            count++;
            return pos + 1e-6f * count * (rot * Vector3.up);
        }
    }
}