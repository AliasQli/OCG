
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDK3.Persistence;
using VRC.SDKBase;
using VRC.Udon;

namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.None)]
    public class BoardUX : UdonSharpBehaviour
    {
        public bool isSubst = true;
        Board board;
        public TMPro.TMP_InputField lpText;
        public TMPro.TMP_Text plusSubstText;

        void Start()
        {
            // table = GetComponentInParent<Table>();
            // side = GetComponentInParent<Side>();
            board = GetComponentInParent<Board>();
        }

        // public void OnReset()
        // {
        //     if (side.ownerId != Networking.LocalPlayer.playerId) return;
        //     if (side.board.lp != 0) return;
        //     table.Reset();
        // }

        // public void OnJoin()
        // {
        //     Debug.Log($"[SideUX] OnJoin {side.uid} by {Networking.LocalPlayer.displayName}");
        //     if (side.ownerId != -1) return;
        //     var json = PlayerData.GetString(Networking.LocalPlayer, "deck0");
        //     if (string.IsNullOrEmpty(json))
        //     {
        //         Debug.LogWarning("No deck data found");
        //         return;
        //     }
        //     if (VRCJson.TryDeserializeFromJson(json, out var deck))
        //     {
        //         if (deck.TokenType == TokenType.DataList && deck.DataList.Count == 3)
        //         {
        //             DataList main = deck.DataList[0].DataList;
        //             DataList extra = deck.DataList[1].DataList;
        //             DataList sideDeck = deck.DataList[2].DataList;
        //             side.JoinAndSetCards(main, extra, sideDeck);
        //             side.Init();
        //             return;
        //         }
        //     }
        //     Debug.LogError($"Invalid deck data {json}");
        // }

        // public void OnLeave()
        // {
        //     if (side.ownerId != Networking.LocalPlayer.playerId) return;
        //     side.Leave();
        // }

        // public void UpdateOwnerId()
        // {
        //     Debug.Log($"[SideUX] UpdateOwnerIdUX: {side.ownerId}");
        //     var player = VRCPlayerApi.GetPlayerById(side.ownerId);
        //     if (ownerIdText == null)
        //     {
        //         Debug.LogError("[SideUX] ownerIdText is null");
        //     }
        //     if (player != null)
        //     {
        //         ownerIdText.text = $"Owner: {player.displayName}";
        //     }
        //     else
        //     {
        //         ownerIdText.text = "No Owner";
        //     }
        // }

        public void UpdateLPText()
        {
            Debug.Log($"[BoardUX] UpdateLPText: {board.lp}");
            lpText.text = $"{board.lp}";
        }

        public void UpdatePlusSubstText()
        {
            plusSubstText.text = isSubst ? "-" : "+";
        }

        public void OnClickSubst()
        {
            isSubst = true;
            UpdatePlusSubstText();
        }

        public void OnClickPlus()
        {
            isSubst = false;
            UpdatePlusSubstText();
        }

        void ClickX(int amount)
        {
            int newLP = isSubst ? board.lp - amount : board.lp + amount;
            board.SetLP(newLP);
        }
        
        public void OnClick1()
        {
            ClickX(1);
        }

        public void OnClick5()
        {
            ClickX(5);
        }

        public void OnClick10()
        {
            ClickX(10);
        }

        public void OnClick50()
        {
            ClickX(50);
        }

        public void OnClick100()
        {
            ClickX(100);
        }

        public void OnClick500()
        {
            ClickX(500);
        }

        public void OnClick1000()
        {
            ClickX(1000);
        }

        public void OnClick5000()
        {
            ClickX(5000);
        }
    }
}