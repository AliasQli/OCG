using UdonSharp;
using UnityEngine;
using VRC.SDK3.Components;
using VRC.SDK3.Data;
using VRC.SDK3.Persistence;
using VRC.SDKBase;

namespace VRCOCG
{
    public class SideUX : UdonSharpBehaviour
    {
        public Side side;

        public void OnLoadDeck()
        {
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
                    // But these are double[] !
                    DataList main = deck.DataList[0].DataList;
                    DataList extra = deck.DataList[1].DataList;
                    DataList sideDeck = deck.DataList[2].DataList;
                    side.SetCards(main, extra, sideDeck);
                    OnInit();
                    return;
                }
            }
            Debug.LogError($"Invalid deck data {json}");
        }

        public void OnInit()
        {
            side.Init();
        }
    }
}