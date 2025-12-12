
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDKBase;
using VRC.Udon;

namespace VRCOCG
{
    public class StackUX : UdonSharpBehaviour
    {
        public GameObject panel;
        private Stack stack;
        // private Side side;
        private StackUX[] allStackUX;
        private CardRegistry cardRegistry;
        private Card[] dispCards = new Card[0];

        [SerializeField] private Transform DrawPos;
        [SerializeField] private Transform CardOffset;
        [SerializeField] private Transform BasePos;
        [SerializeField] private Transform ForwardPos;

        private Vector3 drawPos;
        private Vector3 forwardDir;
        private Quaternion originalPanelRot;
        private readonly Quaternion cardRot = Quaternion.Euler(180, 180, 0);

        void Start()
        {
            stack = GetComponentInParent<Stack>();
            var side = GetComponentInParent<Side>();
            allStackUX = side.GetComponentsInChildren<StackUX>();
            cardRegistry = side.cardRegistry;

            drawPos = DrawPos.position;
            forwardDir = ForwardPos.position - panel.transform.position;
            originalPanelRot = panel.transform.rotation;
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
            for (int i = 0; i < allStackUX.Length; i++)
            {
                if (allStackUX[i] != this)
                {
                    allStackUX[i].ClosePanel();
                }
            }

            var p = Networking.LocalPlayer.GetPosition() - panel.transform.position;
            if (Vector3.Dot(forwardDir, p) >= 0)
            {
                panel.transform.rotation = originalPanelRot;
            }
            else
            {
                panel.transform.rotation = Quaternion.Euler(0, 180, 0) * originalPanelRot;
            }

            var cards = stack.cards;
            if (stack.type == Stack.HIDDEN)
            {
                cards = cards.DeepClone();
                cards.Sort();
            }
            const int width = 12;
            dispCards = new Card[cards.Count];
            var cardOffset = CardOffset.position - CardOffset.parent.position;
            var basePos = BasePos.position + cardOffset * 0.5f;
            for (int i = 0; i < cards.Count; i++)
            {
                int w = i % width;
                int h = i / width;
                var card = cardRegistry.New(cards[i].AsInt(), i);
                dispCards[i] = card;
                var pos = basePos + new Vector3(w * cardOffset.x, h * cardOffset.y, 0);
                card.gameObject.transform.SetPositionAndRotation(pos, cardRot * panel.transform.rotation);
                card.cardUX.fromStack = stack;
            }
        }

        void DrawFrom(int p)
        {
            int code = stack.DrawCard(p);
            if (code == -1) return;
            var card = cardRegistry.New(code);
            card.gameObject.transform.SetPositionAndRotation(drawPos, cardRot * panel.transform.rotation);
            card.ConfirmMove();
            ClosePanel();
        }

        public void OnDraw5()
        {
            var cardOffset = CardOffset.position - CardOffset.parent.position;
            for (int i = -2; i <= 2; i++)
            {
                int code = stack.DrawCard(Stack.POS_TOP);
                if (code == -1) return;
                var card = cardRegistry.New(code);
                var pos = drawPos + new Vector3(i * cardOffset.x, 0, 0);
                card.transform.SetPositionAndRotation(pos, cardRot * panel.transform.rotation);
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