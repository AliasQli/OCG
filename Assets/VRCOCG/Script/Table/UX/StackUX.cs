
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDKBase;
using VRC.Udon;

namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.None)]
    public class StackUX : UdonSharpBehaviour
    {
        public GameObject panel;
        private Stack stack;
        // private Side side;
        private StackUX[] allStackUX;
        private CardRegistry cardRegistry;
        public CardRegistry localCardRegistry; // Not synced

        [SerializeField] private Transform DrawPos;
        [SerializeField] private Transform CardOffset;
        [SerializeField] private Transform BasePos;

        private Vector3 drawPos;
        private Vector3 towardPlayerDir; // Towards the player
        private Quaternion originalPanelRot;

        void Start()
        {
            stack = GetComponentInParent<Stack>();
            var side = GetComponentInParent<Side>();
            allStackUX = side.GetComponentsInChildren<StackUX>();
            cardRegistry = side.cardRegistry;

            drawPos = DrawPos.position;
            towardPlayerDir = side.transform.rotation * -Vector3.forward;
            originalPanelRot = panel.transform.rotation;
        }

        public void ClosePanel(Card by = null)
        {
            if (!panel.activeSelf) return;
            panel.SetActive(false);
            if (by != null)
            {
                localCardRegistry.Transfer(by.uid, cardRegistry);
            }
            localCardRegistry.UnregisterAll();
            InteractionText = "Open";
        }

        public override void Interact()
        {
            if (panel.activeSelf)
            {
                ClosePanel();
                return;
            }

            panel.SetActive(true);
            InteractionText = "Close";
            for (int i = 0; i < allStackUX.Length; i++)
            {
                if (allStackUX[i] != this)
                {
                    allStackUX[i].ClosePanel();
                }
            }

            var p = Networking.LocalPlayer.GetPosition() - panel.transform.position;
            if (Vector3.Dot(towardPlayerDir, p) >= 0)
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
            var cardOffset = CardOffset.position - CardOffset.parent.position;
            var basePos = BasePos.position + cardOffset * 0.5f;
            for (int i = 0; i < cards.Count; i++)
            {
                int w = i % width;
                int h = i / width;
                var card = localCardRegistry.New(cards[i].Number, i);
                var pos = basePos + new Vector3(w * cardOffset.x, h * cardOffset.y, 0);
                card.gameObject.transform.SetPositionAndRotation(pos, panel.transform.rotation);
                card.cardUX.fromStack = stack;
            }
        }

        void DrawFrom(int p)
        {
            double code = stack.DrawCard(p);
            if (code < 0)
            {
                ClosePanel();
                return;
            }
            var card = cardRegistry.New(code);
            card.gameObject.transform.SetPositionAndRotation(drawPos, panel.transform.rotation);
            card.ConfirmMove();
            ClosePanel();
        }

        public void OnDraw5()
        {
            var cardOffset = CardOffset.position - CardOffset.parent.position;
            for (int i = -2; i <= 2; i++)
            {
                double code = stack.DrawCard(Stack.POS_TOP);
                if (code < 0) break;
                var card = cardRegistry.New(code);
                var pos = drawPos + new Vector3(i * cardOffset.x, 0, 0);
                card.transform.SetPositionAndRotation(pos, panel.transform.rotation);
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