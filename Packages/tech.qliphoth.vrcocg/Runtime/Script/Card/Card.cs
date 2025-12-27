using System;
using TMPro;
using UdonSharp;
using UnityEngine;
using VRC.Udon.Common.Interfaces;

namespace VRCOCG
{
    [UdonBehaviourSyncMode(BehaviourSyncMode.None)]
    public class Card : UdonSharpBehaviour
    {
        public CardUX cardUX;
        public string uid;
        public double code;
        new private Renderer renderer;
        public new TMP_Text name;
        public TMP_Text desc;
        public TMP_Text pdesc;
        public TMP_Text atk;
        public TMP_Text def;
        public TMP_Text link;
        public TMP_Text lscale;
        public TMP_Text rscale;
        public TMP_Text password;

        public Side side;
        public DataCenter dataCenter;

        // public string cardName;
        // public string desc;
        // public string pdsec;

        // public uint type;
        // public uint race;
        // public uint attribute;
        // public int atk; // -2 is ?
        // public int def; // LINK
        // public int level; // or link arrows as bitmask
        // public int lscale;
        // public int rscale;
        // private DataDictionary data;

        [NonSerialized] public long timestamp = 0;

        void Start()
        {
            renderer = GetComponentInChildren<Renderer>();
        }

        public void SetCard(double c)
        {
            code = c;
            renderer.sharedMaterial = dataCenter.GetMaterial(code);
            Material mat = renderer.material;
            var d = dataCenter.Get(code);
            if (d == null)
            {
                Debug.LogError($"[Card] Data not found for code {code}");
                return;
            }
            var offset = d["offset"].DataDictionary;
            var data = d["data"].DataDictionary;
            var text = d["text"].DataDictionary["cn"].DataDictionary;
            int type = data["type"].AsInt();
            bool isMonster = (type & DataCenter.TYPE_MONSTER) != 0;
            bool isXYZ = (type & DataCenter.TYPE_XYZ) != 0;
            bool isP = (type & DataCenter.TYPE_PENDULUM) != 0;
            bool isLink = (type & DataCenter.TYPE_LINK) != 0;

            mat.SetInteger("_IsPendulum", isP ? 1 : 0);
            mat.SetInteger("_Arrow", isLink ? data["def"].AsInt() : -1);

            Vector2 cardOffset = new Vector2(offset["x"].AsInt(), offset["y"].AsInt());
            mat.SetTextureOffset(isP ? "_PendulumTex" : "_MainTex", cardOffset);

            #region _EffectTex
            if (dataCenter.IsKiraMaterial(code))
            {
                int offsetX = isP ? 1 : (isLink? 2 : 0);
                Vector2 effectOffset = new Vector2(offsetX, 0);
                mat.SetTextureOffset("_NormalMap", effectOffset);
                mat.SetTextureOffset("_FrameMask", effectOffset);
            }
            #endregion

            #region _BaseTex
            Vector2 baseTexOffset = Vector2.zero;
            if ((type & DataCenter.TYPE_NORMAL) != 0) baseTexOffset = new Vector2(0, 3);
            else if ((type & DataCenter.TYPE_RITUAL) != 0) baseTexOffset = new Vector2(2, 3);
            else if ((type & DataCenter.TYPE_FUSION) != 0) baseTexOffset = new Vector2(3, 3);
            else if ((type & DataCenter.TYPE_SYNCHRO) != 0) baseTexOffset = new Vector2(0, 2);
            else if ((type & DataCenter.TYPE_XYZ) != 0) baseTexOffset = new Vector2(1, 2);
            else if ((type & DataCenter.TYPE_TOKEN) != 0) baseTexOffset = new Vector2(2, 2);
            else if ((type & DataCenter.TYPE_LINK) != 0) baseTexOffset = new Vector2(3, 2);
            else if ((type & DataCenter.TYPE_EFFECT) != 0) baseTexOffset = new Vector2(1, 3);
            else if ((type & DataCenter.TYPE_SPELL) != 0) baseTexOffset = new Vector2(2, 0);
            else if ((type & DataCenter.TYPE_TRAP) != 0) baseTexOffset = new Vector2(3, 0);
            else Debug.LogError($"Unknown card type for code {code}: {type}");
            if (isP)
            {
                baseTexOffset.y -= 2;
            }
            mat.SetTextureOffset("_BaseTex", baseTexOffset);
            #endregion

            #region _AttrTex
            int attr = data["attribute"].AsInt();
            int attrIndex = 0;
            if ((attr & DataCenter.ATTRIBUTE_EARTH) != 0) attrIndex = 0;
            else if ((attr & DataCenter.ATTRIBUTE_WATER) != 0) attrIndex = 1;
            else if ((attr & DataCenter.ATTRIBUTE_FIRE) != 0) attrIndex = 2;
            else if ((attr & DataCenter.ATTRIBUTE_WIND) != 0) attrIndex = 3;
            else if ((attr & DataCenter.ATTRIBUTE_LIGHT) != 0) attrIndex = 4;
            else if ((attr & DataCenter.ATTRIBUTE_DARK) != 0) attrIndex = 5;
            else if ((attr & DataCenter.ATTRIBUTE_DEVINE) != 0) attrIndex = 6;
            else if ((type & DataCenter.TYPE_SPELL) != 0) attrIndex = 7;
            else if ((type & DataCenter.TYPE_TRAP) != 0) attrIndex = 8;
            else Debug.LogError($"Unknown attribute for code {code}: {attr}");
            mat.SetTextureOffset("_AttrTex", new Vector2(attrIndex, 0));
            #endregion

            #region _IconTex
            int iconIndex;
            if ((type & DataCenter.TYPE_RITUAL) != 0) iconIndex = 1;
            else if ((type & DataCenter.TYPE_EQUIP) != 0) iconIndex = 2;
            else if ((type & DataCenter.TYPE_FIELD) != 0) iconIndex = 3;
            else if ((type & DataCenter.TYPE_CONTINUOUS) != 0) iconIndex = 4;
            else if ((type & DataCenter.TYPE_QUICKPLAY) != 0) iconIndex = 5;
            else if ((type & DataCenter.TYPE_COUNTER) != 0) iconIndex = 6;
            else iconIndex = 0;
            mat.SetTextureOffset("_IconTex", new Vector2(iconIndex, 0));
            #endregion

            #region _LevelTex
            int level;
            if (isMonster && !isLink)
            {
                level = data["level"].AsInt() & 0xF;
                if (data.TryGetValue("displevel", out var displevel))
                {
                    level = displevel.AsInt() & 0xF;
                }
                if (isXYZ)
                {
                    level *= -1;
                }
            }
            else
            {
                level = 0;
            }
            mat.SetTextureOffset("_LevelTex", new Vector2(0, level));
            #endregion

            #region text fields
            name.gameObject.SetActive(true);
            desc.gameObject.SetActive(true);
            password.gameObject.SetActive(true);
            name.text = text["name"].String;
            if (isMonster)
            {
                desc.text = DataCenter.GetMonsterString(type, data["race"].AsInt()) + "\n" + 
                    DataCenter.GetDescCompact(type, text["desc"].String);
            }
            else
            {
                desc.text = DataCenter.GetDescCompact(type, text["desc"].String);
            }
            password.text = code.ToString();
            if (isP)
            {
                pdesc.gameObject.SetActive(true);
                lscale.gameObject.SetActive(true);
                rscale.gameObject.SetActive(true);
                pdesc.text = text["pdesc"].String.Replace("\r\n", "");
                lscale.text = data["lscale"].AsInt().ToString();
                rscale.text = data["rscale"].AsInt().ToString();
            }
            else
            {
                pdesc.gameObject.SetActive(false);
                lscale.gameObject.SetActive(false);
                rscale.gameObject.SetActive(false);
            }
            if (isMonster)
            {
                int rawATK = data["atk"].AsInt();
                int rawDEF = data["def"].AsInt();
                atk.gameObject.SetActive(true);
                atk.text = rawATK >= 0 ? rawATK.ToString() : "?";
                if (isLink)
                {
                    def.gameObject.SetActive(false);
                    link.gameObject.SetActive(true);
                    link.text = (data["level"].AsInt() & 0xF).ToString();
                }
                else
                {
                    def.gameObject.SetActive(true);
                    link.gameObject.SetActive(false);
                    def.text = rawDEF >= 0 ? rawDEF.ToString() : "?";
                }
            }
            else
            {
                atk.gameObject.SetActive(false);
                def.gameObject.SetActive(false);
                link.gameObject.SetActive(false);
            }

            if (isXYZ)
            {
                name.color = Color.white;
                password.color = Color.white;
            }
            else if (isLink || !isMonster)
            {
                name.color = Color.white;
                password.color = Color.black;
            }
            else
            {
                name.color = Color.black;
                password.color = Color.black;
            }
            #endregion
        }

        // Move has been done, this is just a confirmation (send sync event)
        public void ConfirmMove()
        {
            var t = gameObject.transform;
            timestamp = Helper.GetTimestamp();
            side.cardListener.SendCustomNetworkEvent(NetworkEventTarget.Others,
                nameof(CardListener.SyncCardMove), timestamp, uid, code, t.position, t.rotation);
        }

        public void Remove()
        {
            side.cardListener.SendCustomNetworkEvent(NetworkEventTarget.All,
                nameof(CardListener.SyncCardRemove), Helper.GetTimestamp(), uid);
        }

        public void Init()
        {
            timestamp = 0;
            cardUX.Init();
        }

        public void Uninit()
        {
            if (renderer.material != null && renderer.material != renderer.sharedMaterial)
            {
                Destroy(renderer.material);
            }
            renderer.material = renderer.sharedMaterial;
            cardUX.Uninit();
        }
    }
}