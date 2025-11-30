
using System;
using UdonSharp;
using UnityEngine;
using UnityEngine.UI;
using VRC.SDK3.Data;
using VRCOCG;

public class DataCenter : UdonSharpBehaviour
{
    [SerializeField] private TextAsset dataJSON;
    private DataDictionary data;
    private DataDictionary cache = new DataDictionary();

    void Start()
    {
        VRCJson.TryDeserializeFromJson(dataJSON.text, out DataToken d);
        data = d.DataDictionary;
    }

    public DataDictionary Get(int code)
    {
        var s = $"{code}";
        if (cache.TryGetValue(s, TokenType.DataDictionary, out var d))
        {
            return d.DataDictionary;
        }
        else if (data.TryGetValue(s, TokenType.DataDictionary, out d))
        {
            cache["s"] = d;
            return d.DataDictionary;
        }
        else
        {
            return null;
        }
    }

    static public void SetMaterial(Material mat, int code, DataDictionary d)
    {
        var offset = d["offset"].DataDictionary;
        var data = d["data"].DataDictionary;
        // var text = data["text"].DataDictionary["cn"].DataDictionary;
        int type = data["type"].AsInt();
        bool isMonster = (type & TYPE_MONSTER) != 0;
        bool isXYZ = (type & TYPE_XYZ) != 0;
        bool isP = (type & TYPE_PENDULUM) != 0;
        bool isLink = (type & TYPE_LINK) != 0;

        mat.SetInteger("_IsPendulum", isP ? 1 : 0);
        mat.SetInteger("_Arrow", isLink ? data["def"].AsInt() : -1);

        Vector2 cardOffset = new Vector2(offset["x"].AsInt(), offset["y"].AsInt());
        mat.SetTextureOffset(isP ? "_PendulumTex" : "_MainTex", cardOffset);

        #region _BaseTex
        Vector2 baseTexOffset = Vector2.zero;
        if ((type & TYPE_NORMAL) != 0)
        {
            baseTexOffset = new Vector2(0, 3);
        }
        else if ((type & TYPE_RITUAL) != 0)
        {
            baseTexOffset = new Vector2(2, 3);
        }
        else if ((type & TYPE_FUSION) != 0)
        {
            baseTexOffset = new Vector2(3, 3);
        }
        else if ((type & TYPE_SYNCHRO) != 0)
        {
            baseTexOffset = new Vector2(0, 2);
        }
        else if ((type & TYPE_XYZ) != 0)
        {
            baseTexOffset = new Vector2(1, 2);
        }
        else if ((type & TYPE_TOKEN) != 0)
        {
            baseTexOffset = new Vector2(2, 2);
        }
        else if ((type & TYPE_LINK) != 0)
        {
            baseTexOffset = new Vector2(3, 2);
        } 
        else if ((type & TYPE_EFFECT) != 0)
        {
            baseTexOffset = new Vector2(1, 3);
        }
        else if ((type & TYPE_SPELL) != 0)
        {
            baseTexOffset = new Vector2(2, 0);
        }
        else if ((type & TYPE_TRAP) != 0)
        {
            baseTexOffset = new Vector2(3, 0);
        }
        else
        {
            Debug.LogError($"Unknown card type for code {code}: {type}");
        }
        if (isP)
        {
            baseTexOffset.y -= 2;
        }
        mat.SetTextureOffset("_BaseTex", baseTexOffset);
        #endregion

        #region _AttrTex
        int attr = data["attribute"].AsInt();
        int attrIndex = 0;
        if ((attr & ATTRIBUTE_EARTH) != 0) attrIndex = 0;
        else if ((attr & ATTRIBUTE_WATER) != 0) attrIndex = 1;
        else if ((attr & ATTRIBUTE_FIRE) != 0) attrIndex = 2;
        else if ((attr & ATTRIBUTE_WIND) != 0) attrIndex = 3;
        else if ((attr & ATTRIBUTE_LIGHT) != 0) attrIndex = 4;
        else if ((attr & ATTRIBUTE_DARK) != 0) attrIndex = 5;
        else if ((attr & ATTRIBUTE_DEVINE) != 0) attrIndex = 6;
        else if ((type & TYPE_SPELL) != 0) attrIndex = 7;
        else if ((type & TYPE_TRAP) != 0) attrIndex = 8;
        else Debug.LogError($"Unknown attribute for code {code}: {attr}");
        mat.SetTextureOffset("_AttrTex", new Vector2(attrIndex, 0));
        #endregion

        #region _IconTex
        int iconIndex;
        if ((type & TYPE_RITUAL) != 0)
        {
            iconIndex = 1;
        }
        else if ((type & TYPE_EQUIP) != 0)
        {
            iconIndex = 2;
        }
        else if ((type & TYPE_FIELD) != 0)
        {
            iconIndex = 3;
        }
        else if ((type & TYPE_CONTINUOUS) != 0)
        {
            iconIndex = 4;
        }
        else if ((type & TYPE_QUICKPLAY) != 0)
        {
            iconIndex = 5;
        }
        else if ((type & TYPE_COUNTER) != 0)
        {
            iconIndex = 6;
        }
        else 
        {
            iconIndex = 0;
        }
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
    }

    public const int TYPE_MONSTER = 0x1;
    public const int TYPE_SPELL = 0x2;
    public const int TYPE_TRAP = 0x4;
    public const int TYPE_NORMAL = 0x10;
    public const int TYPE_EFFECT = 0x20;
    public const int TYPE_FUSION = 0x40;
    public const int TYPE_RITUAL = 0x80;
    public const int TYPE_TRAPMONSTER = 0x100;
    public const int TYPE_SPIRIT = 0x200;
    public const int TYPE_UNION = 0x400;
    public const int TYPE_DUAL = 0x800;
    public const int TYPE_TUNER = 0x1000;
    public const int TYPE_SYNCHRO = 0x2000;
    public const int TYPE_TOKEN = 0x4000;
    public const int TYPE_QUICKPLAY = 0x10000;
    public const int TYPE_CONTINUOUS = 0x20000;
    public const int TYPE_EQUIP = 0x40000;
    public const int TYPE_FIELD = 0x80000;
    public const int TYPE_COUNTER = 0x100000;
    public const int TYPE_FLIP = 0x200000;
    public const int TYPE_TOON = 0x400000;
    public const int TYPE_XYZ = 0x800000;
    public const int TYPE_PENDULUM = 0x1000000;
    public const int TYPE_SPSUMMON = 0x2000000;
    public const int TYPE_LINK = 0x4000000;

    //Attributes
    public const int ATTRIBUTES_COUNT = 7;
    public const int ATTRIBUTE_ALL = 0x7f;    //
    public const int ATTRIBUTE_EARTH = 0x01;   //
    public const int ATTRIBUTE_WATER = 0x02;   //
    public const int ATTRIBUTE_FIRE = 0x04;    //
    public const int ATTRIBUTE_WIND = 0x08;    //
    public const int ATTRIBUTE_LIGHT = 0x10;   //
    public const int ATTRIBUTE_DARK = 0x20;    //
    public const int ATTRIBUTE_DEVINE = 0x40;  //

    //Races
    public const int RACES_COUNT = 26;
    public const int RACE_ALL = 0x3ffffff;
    public const int RACE_WARRIOR = 0x1;            //
    public const int RACE_SPELLCASTER = 0x2;       //
    public const int RACE_FAIRY = 0x4;             //
    public const int RACE_FIEND = 0x8;             //
    public const int RACE_ZOMBIE = 0x10;           //
    public const int RACE_MACHINE = 0x20;          //
    public const int RACE_AQUA = 0x40;             //
    public const int RACE_PYRO = 0x80;             //
    public const int RACE_ROCK = 0x100;            //
    public const int RACE_WINDBEAST = 0x200;       //
    public const int RACE_PLANT = 0x400;           //
    public const int RACE_INSECT = 0x800;          //
    public const int RACE_THUNDER = 0x1000;        //
    public const int RACE_DRAGON = 0x2000;         //
    public const int RACE_BEAST = 0x4000;          //
    public const int RACE_BEASTWARRIOR = 0x8000;   //
    public const int RACE_DINOSAUR = 0x10000;      //
    public const int RACE_FISH = 0x20000;          //
    public const int RACE_SEASERPENT = 0x40000;    //
    public const int RACE_REPTILE = 0x80000;       //
    public const int RACE_PSYCHO = 0x100000;       //
    public const int RACE_DEVINE = 0x200000;       //
    public const int RACE_CREATORGOD = 0x400000;   //
    public const int RACE_WYRM = 0x800000;         //
    public const int RACE_CYBERSE = 0x1000000;     //
    public const int RACE_ILLUSION = 0x2000000;    //

    public const int LINK_MARKER_BOTTOM_LEFT = 0x001;
    public const int LINK_MARKER_BOTTOM = 0x002;
    public const int LINK_MARKER_BOTTOM_RIGHT = 0x004;
    public const int LINK_MARKER_LEFT = 0x008;
    public const int LINK_MARKER_RIGHT = 0x020;
    public const int LINK_MARKER_TOP_LEFT = 0x040;
    public const int LINK_MARKER_TOP = 0x080;
    public const int LINK_MARKER_TOP_RIGHT = 0x100;
}
