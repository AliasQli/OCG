using System;
using System.Text;
using UdonSharp;
using UnityEngine;


namespace VRCOCG
{
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

        public Card New(int code, Side side)
        {
            Card card;
            if (index > 0)
            {
                index--;
                card = buffer[index];
            }
            else
            {
                card = Instantiate(prefab, gameObject.transform, true).GetComponent<Card>();
            }
            // Init
            card.gameObject.SetActive(true);
            card.Thaw();
            card.timestamp = DateTime.UtcNow.ToFileTimeUtc();
            card.dataCenter = dataCenter;
            card.side = side;
            card.SetCard(code);
            return card;
        }

        public void Recycle(Card card)
        {
            card.Freeze();
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
                var obj = Instantiate(prefab, gameObject.transform, true);
                obj.SetActive(false);
                buffer[index] = obj.GetComponent<Card>();
                index++;
            }
        }
    }
}