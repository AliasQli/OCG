using System;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Components;
using VRC.SDK3.Data;
using VRC.SDK3.Persistence;
using VRC.SDKBase;

namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.None)]
    public class SideUX : UdonSharpBehaviour
    {
        Side side;
        Table table;
        public TMPro.TMP_Text ownerIdText;

        void Start()
        {
            table = GetComponentInParent<Table>();
            side = GetComponentInParent<Side>();
        }

        public void OnReset()
        {
            // if (side.ownerId != Networking.LocalPlayer.playerId) return;
            if (side.board.lp != 0) return;
            table.Reset();
        }

        public void OnJoin()
        {
            Debug.Log($"[SideUX] OnJoin {side.uid} by {Networking.LocalPlayer.displayName}");
            if (side.ownerId != -1) return;
            var json = PlayerData.GetString(Networking.LocalPlayer, "deck0");
            if (string.IsNullOrEmpty(json))
            {
                Debug.LogWarning("No deck data found");
                return;
            }
            if (VRCJson.TryDeserializeFromJson(json, out var deck))
            {
                if (deck.TokenType == TokenType.DataList && deck.DataList.Count == 3)
                {
                    DataList main = deck.DataList[0].DataList;
                    DataList extra = deck.DataList[1].DataList;
                    DataList sideDeck = deck.DataList[2].DataList;
                    side.JoinAndSetCards(main, extra, sideDeck);
                    side.Init();
                    return;
                }
            }
            Debug.LogError($"Invalid deck data {json}");
        }

        public void OnLeave()
        {
            if (side.ownerId != Networking.LocalPlayer.playerId) return;
            side.Leave();
        }

        public void UpdateOwnerId()
        {
            Debug.Log($"[SideUX] UpdateOwnerId: {side.ownerId}");
            var player = VRCPlayerApi.GetPlayerById(side.ownerId);
            if (player != null)
            {
                ownerIdText.text = player.displayName;
            }
            else
            {
                ownerIdText.text = "No Player";
            }
        }
    }
}