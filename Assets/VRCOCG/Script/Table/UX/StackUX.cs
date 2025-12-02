
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

namespace VRCOCG
{
    public class StackUX : UdonSharpBehaviour
    {
        public GameObject panel;
        private Stack stack;
        private Side side;
        private CardRegistry cardRegistry;
        private Card[] dispCards = new Card[0];

        [SerializeField] private Transform DrawPos;
        [SerializeField] private Transform CardOffset;
        [SerializeField] private Transform CardOffsetBase;
        [SerializeField] private Transform BasePos;

        private Vector3 drawPos;
        private Vector3 cardOffset;
        private Vector3 basePos;
        private Quaternion cardRot; // TODO

        void Start()
        {
            stack = GetComponentInParent<Stack>();
            side = GetComponentInParent<Side>();
            cardRegistry = side.cardRegistry;

            drawPos = DrawPos.position;
            cardOffset = CardOffset.position - CardOffsetBase.position;
            basePos = BasePos.position + cardOffset * 0.5f;
            cardRot = Quaternion.Euler(180, 180, 0) * panel.transform.rotation;
        }

        public void ClosePanel(Card by = null)
        {
            if (!panel.activeSelf) return;
            panel.SetActive(false);
            foreach (var c in dispCards)
            {
                if (c != by)
                {
                    cardRegistry.Unregister(c);
                }
            }
            dispCards = new Card[0];
        }

        public override void Interact()
        {
            if (panel.activeSelf)
            {
                ClosePanel();
                return;
            }

            panel.SetActive(true);
            var cards = stack.cards.DeepClone();
            cards.Sort();
            const int width = 12;
            dispCards = new Card[cards.Count];
            for (int i = 0; i < cards.Count; i++)
            {
                int w = i % width;
                int h = i / width;
                var card = cardRegistry.New(cards[i].AsInt(), side);
                dispCards[i] = card;
                var pos = basePos + new Vector3(w * cardOffset.x, h * cardOffset.y, 0);
                card.gameObject.transform.SetPositionAndRotation(pos, cardRot);
                card.cardUX.fromStack = stack;
            }
        }

        void DrawFrom(int p)
        {
            int code = stack.DrawCard(p);
            if (code == -1) return;
            var card = cardRegistry.New(code, side);
            card.ConfirmMove();
            ClosePanel();
        }

        public void OnDraw5()
        {
            for (int i = -2; i <= 2; i++)
            {
                int code = stack.DrawCard(Stack.POS_TOP);
                if (code == -1) return;
                var card = cardRegistry.New(code, side);
                var pos = drawPos + new Vector3(i * cardOffset.x, 0, 0);
                card.gameObject.transform.SetPositionAndRotation(pos, cardRot);
                card.ConfirmMove();
            }
            
            ClosePanel();
        }

        public void OnDraw()
        {
            DrawFrom(Stack.POS_TOP);
        }
        
        public void OnDrawBottom()
        {
            DrawFrom(Stack.POS_BOTTOM);
        }

        public void OnDrawRandom()
        {
            DrawFrom(Stack.POS_RANDOM);
        }
    }
}