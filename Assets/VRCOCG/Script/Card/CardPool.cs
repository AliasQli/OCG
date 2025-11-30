using System;
using System.Text;
using UdonSharp;
using UnityEngine;


namespace VRCOCG
{
    public class CardPool : UdonSharpBehaviour
    {
        [SerializeField] private GameObject prefab;
        [SerializeField] private int bufferDanger = 64;
        [SerializeField] private int bufferLimit = 256;
        public DataCenter dataCenter;
        public CardManager cardManager;
        private Card[] buffer;
        private uint index = 0;
        [SerializeField] private Registry registry;

        void Start()
        {
            buffer = new Card[bufferLimit];
        }

        public Card New(int code, Side side, string uid = null)
        {
            Card card;
            if (index > 0)
            {
                index--;
                Debug.Log($"[CardPool] Reusing buffer index {index}");
                card = buffer[index];
                buffer[index] = null;
                StringBuilder sb = new StringBuilder($"[CardPool] Buffer is (index = {index}) ");
                for (int i = 0; i < bufferLimit; i++)
                {
                    sb.Append($"{(buffer[i] == null ? "0" : "1")}");
                }
                Debug.Log(sb.ToString());
                card.timestamp = DateTime.UtcNow.ToFileTimeUtc(); // FIX: null
            }
            else
            {
                card = Instantiate(prefab, gameObject.transform, true).GetComponent<Card>();
            }
            // Init
            card.gameObject.SetActive(true);
            if (uid == null)
            {
                uid = Helper.GenerateId(prefab.name);
            }
            registry.Register(uid, card);
            card.cardPool = this;
            card.cardManager = cardManager;
            card.dataCenter = dataCenter;
            card.uid = uid;
            card.side = side;
            side.cards.Add(card);
            card.Thaw();
            card.SetCard(code);
            return card;
        }

        public void Destroy(Card card)
        {
            if (card != null)
            {
                Debug.Log($"[CardPool] Destroying card {card.uid}");
            } else {
                    Debug.LogError($"[CardPool] Buffering null card at index {index}");
                }
            registry.Unregister(card.uid);
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

        // Nullable
        public Card TryGet(string uid)
        {
            return (Card)registry.TryGet(uid);
        }

        public Card Get(string uid, int code, Side side)
        {
            var card = TryGet(uid);
            if (card == null)
            {
                card = New(code, side, uid);
                card.timestamp = 0;
            }
            return card;
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