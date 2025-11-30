
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

namespace VRCOCG
{
    public class StackUX : UdonSharpBehaviour
    {
        public GameObject plane;
        private Stack stack;
        private Side side;
        private CardPool cardPool;
        private Card[] dispCards = new Card[0];

        [SerializeField] private Transform DrawPos;
        [SerializeField] private Transform CardOffset;
        [SerializeField] private Transform BasePos;

        private Vector3 drawOffset;
        private Vector3 cardOffset;
        private Vector3 basePos;

        void Start()
        {
            stack = gameObject.GetComponentInParent<Stack>();
            side = gameObject.GetComponentInParent<Side>();
            var table = gameObject.GetComponentInParent<Table>();
            cardPool = table.cardPool;

            drawOffset = DrawPos.localPosition;
            cardOffset = CardOffset.localPosition;
            basePos = BasePos.position + cardOffset * 0.5f;
        }

        public void ClosePanel(Card by = null)
        {
            if (!plane.activeSelf) return;
            plane.SetActive(false);
            foreach (var c in dispCards)
            {
                if (c != by)
                {
                    if (c == null)
                    {
                        Debug.LogWarning("[StackUX] ClosePanel: dispCards contains null");
                        continue;
                    }
                    cardPool.Destroy(c);
                }
            }
            dispCards = new Card[0];
        }

        public override void Interact()
        {
            if (plane.activeSelf)
            {
                ClosePanel();
                return;
            }

            plane.SetActive(true);
            var cards = stack.cards.DeepClone();
            cards.Sort();
            const int width = 12;
            dispCards = new Card[cards.Count];
            for (int i = 0; i < cards.Count; i++)
            {
                int w = i % width;
                int h = i / width;
                var card = cardPool.New(cards[i].AsInt(), side);
                dispCards[i] = card;
                var pos = basePos + new Vector3(w * cardOffset.x, h * cardOffset.y, 0);
                var rot = side.cardRot;
                card.gameObject.transform.SetPositionAndRotation(pos, rot); // FIX: null
                card.cardUX.fromStack = stack;
            }
        }

        void DrawFrom(int p)
        {
            int code = stack.DrawCard(p);
            if (code == -1) return;
            var card = cardPool.New(code, side);
            var pos = gameObject.transform.position + drawOffset;
            var rot = side.cardRot;
            card.gameObject.transform.SetPositionAndRotation(pos, rot);
            card.ConfirmMove();
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