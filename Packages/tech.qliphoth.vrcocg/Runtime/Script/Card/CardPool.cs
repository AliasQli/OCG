using System;
using System.Text;
using UdonSharp;
using UnityEngine;


namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.None)]
    public class CardPool : UdonSharpBehaviour
    {
        public GameObject prefab;
        [SerializeField] private int bufferDanger = 64;
        [SerializeField] private int bufferLimit = 256;
        public DataCenter dataCenter;
        private Card[] buffer;
        private uint index = 0;

        void Start()
        {
            buffer = new Card[bufferLimit];
        }

        public Card New(double code, string uid, Side side)
        {
            Card card;
            if (index > 0)
            {
                index--;
                card = buffer[index];
            }
            else
            {
                card = Instantiate(prefab, transform, true).GetComponent<Card>();
            }
            // Init
            card.gameObject.SetActive(true);
            var scale = side.scale;
            card.transform.localScale = new Vector3(scale, scale, scale);
            card.Init();
            card.dataCenter = dataCenter;
            card.uid = uid;
            card.side = side;
            card.SetCard(code);
            return card;
        }

        public void Recycle(Card card)
        {
            card.Uninit();
            if (index < bufferLimit)
            {
                card.gameObject.SetActive(false);
                buffer[index] = card;
                index++;
            }
            else
            {
                Destroy(card.gameObject);
            }
        }

        void Update()
        {
            if (index < bufferDanger)
            {
                var obj = Instantiate(prefab, transform, true);
                obj.SetActive(false);
                buffer[index] = obj.GetComponent<Card>();
                index++;
            }
        }
    }
}