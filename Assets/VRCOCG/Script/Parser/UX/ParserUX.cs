using System;
using System.Text.RegularExpressions;
using TMPro;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;
using VRC.SDK3.Persistence;
using VRC.SDKBase;
using VRC.Udon;

namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.None)]
    public class ParserUX : UdonSharpBehaviour
    {
        public TMP_InputField field;
        public DataCenter dataCenter;

        private DataList ParseYDKHelper(string s)
        {
            var d = new DataList();
            var codes = s.Split('\n', StringSplitOptions.RemoveEmptyEntries);
            foreach (var code in codes)
            {
                var c = code.Trim();
                if (c == "") continue;
                if (int.TryParse(c, out var i))
                {
                    if (dataCenter.Get(i) == null)
                    {
                        Debug.LogError($"code {code} not exist");
                        return null;
                    }
                    d.Add((double)i);
                }
                else
                {
                    Debug.LogError($"can't parse code {code}");
                    return null;
                }
            }
            return d;
        }

        public DataList ParseYDK(string ydk)
        {
            Regex regex = new Regex(@"#main([\d\s]*)#extra([\d\s]*)!side([\d\s]*)");
            var m = regex.Matches(ydk);
            if (m.Count != 1)
            {
                Debug.LogError($"count {m.Count}");
                return null;
            }
            var groups = m[0].Groups;
            DataList r = new DataList();
            for (int i = 0; i < 3; i++)
            {
                var arr = ParseYDKHelper(groups[i+1].Value);
                if (arr == null) return null;
                r.Add(arr);
            }
            return r;
        }

        public void OnClick()
        {
            var t = field.text;
            var r = ParseYDK(t);
            if (r != null)
            {
                if (VRCJson.TrySerializeToJson(r, JsonExportType.Minify, out var json))
                {
                    PlayerData.SetString("deck0", json.String);
                    Debug.Log("[ParserUX] Deck data saved");
                    field.text = "";
                }
                else
                {
                    // impossible
                    Debug.LogError("Failed to serialize deck");
                }
            }
            else
            {
                Debug.LogWarning($"Not valid ydk {t}");
            }
        }
    }
}