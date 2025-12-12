using System;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDKBase;
using VRC.Udon.Common.Interfaces;

namespace VRCOCG
{
    public class Syncer : UdonSharpBehaviour
    {
        [NonSerialized] public Side[] sides;
        [NonSerialized] public bool ready = false;
        public LatejoinReceiver templateReceiver;
        void Start()
        {
            sides = GetComponentsInChildren<Side>();
        }

        public override void OnPlayerRestored(VRCPlayerApi player)
        {
            Debug.Log($"[Syncer] OnPlayerRestored: {player.displayName}, {player.playerId}, {player.isLocal}");
            if (player.isLocal) return;
            if (!ready && !Networking.LocalPlayer.isMaster) return;
            ready = true;
            var receiver = (LatejoinReceiver)Networking.FindComponentInPlayerObjects(player, templateReceiver);
            if (receiver == null)
            {
                Debug.LogError("[Syncer] LatejoinReceiver not found for player " + player.displayName);
                return;
            }
            var data = new DataDictionary();
            for (int i = 0; i < sides.Length; i++)
            {
                var side = sides[i];
                data[side.uid] = side.Serialize();
            }
            if(!VRCJson.TrySerializeToJson(data, JsonExportType.Minify, out var json))
            {
                Debug.LogError("[Syncer] Failed to serialize data to JSON");
                return;
            }
            receiver.SendCustomNetworkEvent(NetworkEventTarget.Owner, nameof(LatejoinReceiver.SyncLatejoin), json.String);
            Debug.Log($"[Syncer] Sent latejoin data to player {player.displayName}: {json.String}");
        }
    }
}