
using System;
using System.Text;
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

    // static public void SetCardDisplay(Material mat, int code, DataDictionary d)
    // {
        
    //     var offset = d["offset"].DataDictionary;
    //     var data = d["data"].DataDictionary;
    //     int type = data["type"].AsInt();
    //     bool isMonster = (type & TYPE_MONSTER) != 0;
    //     bool isXYZ = (type & TYPE_XYZ) != 0;
    //     bool isP = (type & TYPE_PENDULUM) != 0;
    //     bool isLink = (type & TYPE_LINK) != 0;

    //     mat.SetInteger("_IsPendulum", isP ? 1 : 0);
    //     mat.SetInteger("_Arrow", isLink ? data["def"].AsInt() : -1);

    //     Vector2 cardOffset = new Vector2(offset["x"].AsInt(), offset["y"].AsInt());
    //     mat.SetTextureOffset(isP ? "_PendulumTex" : "_MainTex", cardOffset);

    //     #region _BaseTex
    //     Vector2 baseTexOffset = Vector2.zero;
    //     if ((type & TYPE_NORMAL) != 0)
    //     {
    //         baseTexOffset = new Vector2(0, 3);
    //     }
    //     else if ((type & TYPE_RITUAL) != 0)
    //     {
    //         baseTexOffset = new Vector2(2, 3);
    //     }
    //     else if ((type & TYPE_FUSION) != 0)
    //     {
    //         baseTexOffset = new Vector2(3, 3);
    //     }
    //     else if ((type & TYPE_SYNCHRO) != 0)
    //     {
    //         baseTexOffset = new Vector2(0, 2);
    //     }
    //     else if ((type & TYPE_XYZ) != 0)
    //     {
    //         baseTexOffset = new Vector2(1, 2);
    //     }
    //     else if ((type & TYPE_TOKEN) != 0)
    //     {
    //         baseTexOffset = new Vector2(2, 2);
    //     }
    //     else if ((type & TYPE_LINK) != 0)
    //     {
    //         baseTexOffset = new Vector2(3, 2);
    //     } 
    //     else if ((type & TYPE_EFFECT) != 0)
    //     {
    //         baseTexOffset = new Vector2(1, 3);
    //     }
    //     else if ((type & TYPE_SPELL) != 0)
    //     {
    //         baseTexOffset = new Vector2(2, 0);
    //     }
    //     else if ((type & TYPE_TRAP) != 0)
    //     {
    //         baseTexOffset = new Vector2(3, 0);
    //     }
    //     else
    //     {
    //         Debug.LogError($"Unknown card type for code {code}: {type}");
    //     }
    //     if (isP)
    //     {
    //         baseTexOffset.y -= 2;
    //     }
    //     mat.SetTextureOffset("_BaseTex", baseTexOffset);
    //     #endregion

    //     #region _AttrTex
    //     int attr = data["attribute"].AsInt();
    //     int attrIndex = 0;
    //     if ((attr & ATTRIBUTE_EARTH) != 0) attrIndex = 0;
    //     else if ((attr & ATTRIBUTE_WATER) != 0) attrIndex = 1;
    //     else if ((attr & ATTRIBUTE_FIRE) != 0) attrIndex = 2;
    //     else if ((attr & ATTRIBUTE_WIND) != 0) attrIndex = 3;
    //     else if ((attr & ATTRIBUTE_LIGHT) != 0) attrIndex = 4;
    //     else if ((attr & ATTRIBUTE_DARK) != 0) attrIndex = 5;
    //     else if ((attr & ATTRIBUTE_DEVINE) != 0) attrIndex = 6;
    //     else if ((type & TYPE_SPELL) != 0) attrIndex = 7;
    //     else if ((type & TYPE_TRAP) != 0) attrIndex = 8;
    //     else Debug.LogError($"Unknown attribute for code {code}: {attr}");
    //     mat.SetTextureOffset("_AttrTex", new Vector2(attrIndex, 0));
    //     #endregion

    //     #region _IconTex
    //     int iconIndex;
    //     if ((type & TYPE_RITUAL) != 0)
    //     {
    //         iconIndex = 1;
    //     }
    //     else if ((type & TYPE_EQUIP) != 0)
    //     {
    //         iconIndex = 2;
    //     }
    //     else if ((type & TYPE_FIELD) != 0)
    //     {
    //         iconIndex = 3;
    //     }
    //     else if ((type & TYPE_CONTINUOUS) != 0)
    //     {
    //         iconIndex = 4;
    //     }
    //     else if ((type & TYPE_QUICKPLAY) != 0)
    //     {
    //         iconIndex = 5;
    //     }
    //     else if ((type & TYPE_COUNTER) != 0)
    //     {
    //         iconIndex = 6;
    //     }
    //     else 
    //     {
    //         iconIndex = 0;
    //     }
    //     mat.SetTextureOffset("_IconTex", new Vector2(iconIndex, 0));
    //     #endregion

    //     #region _LevelTex
    //     int level;
    //     if (isMonster && !isLink)
    //     {
    //         level = data["level"].AsInt() & 0xF;
    //         if (data.TryGetValue("displevel", out var displevel))
    //         {
    //             level = displevel.AsInt() & 0xF;
    //         }
    //         if (isXYZ)
    //         {
    //             level *= -1;
    //         }
    //     }
    //     else
    //     {
    //         level = 0;
    //     }
    //     mat.SetTextureOffset("_LevelTex", new Vector2(0, level));
    //     #endregion
    // }

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
    public const int TYPE_EXTRA = TYPE_FUSION | TYPE_SYNCHRO | TYPE_XYZ | TYPE_LINK;

    static public string GetSpellTrapString(int type)
    {
        StringBuilder result = new StringBuilder();
        if ((type & TYPE_QUICKPLAY) != 0) result.Append("速攻");
        else if ((type & TYPE_CONTINUOUS) != 0) result.Append("永续");
        else if ((type & TYPE_EQUIP) != 0) result.Append("装备");
        else if ((type & TYPE_FIELD) != 0) result.Append("场地");
        else if ((type & TYPE_COUNTER) != 0) result.Append("反击");
        if ((type & TYPE_SPELL) != 0) result.Append("魔法");
        else if ((type & TYPE_TRAP) != 0) result.Append("陷阱");
        return result.ToString();
    }

    static public string GetMonsterString(int type, int race)
    {
        if ((type & TYPE_MONSTER) == 0) return "";

        StringBuilder result = new StringBuilder("【");
        result.Append(GetRaceName(race));
        if ((type & TYPE_FUSION) != 0) result.Append("/融合");
        else if ((type & TYPE_RITUAL) != 0) result.Append("/仪式");
        else if ((type & TYPE_SYNCHRO) != 0) result.Append("/同步");
        else if ((type & TYPE_XYZ) != 0) result.Append("/XYZ");
        else if ((type & TYPE_LINK) != 0) result.Append("/连接");

        if ((type & TYPE_PENDULUM) != 0) result.Append("/灵摆");
        if ((type & TYPE_TOKEN) != 0) result.Append("/衍生物");
        if ((type & TYPE_SPIRIT) != 0) result.Append("/灵魂");
        if ((type & TYPE_TOON) != 0) result.Append("/卡通");
        if ((type & TYPE_UNION) != 0) result.Append("/同盟");
        if ((type & TYPE_DUAL) != 0) result.Append("/二重");
        if ((type & TYPE_FLIP) != 0) result.Append("/反转");
        if ((type & TYPE_TUNER) != 0) result.Append("/调整");

        if ((type & TYPE_EFFECT) != 0) result.Append("/效果");
        else if ((type & TYPE_NORMAL) != 0) result.Append("/通常");
        result.Append("】");
        return result.ToString();
    }

    static public string GetDescCompact(int type, string desc)
    {
        // return desc.Replace("\r\n", "") ;
        return desc;
    }

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

    static public string GetAttributeName(int attr)
    {
        switch (attr)
        {
            case ATTRIBUTE_EARTH: return "地";
            case ATTRIBUTE_WATER: return "水";
            case ATTRIBUTE_FIRE: return "炎";
            case ATTRIBUTE_WIND: return "风";
            case ATTRIBUTE_LIGHT: return "光";
            case ATTRIBUTE_DARK: return "暗";
            case ATTRIBUTE_DEVINE: return "神";
            default: return "";
        }
    }

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

    static public string GetRaceName(int race)
    {
        switch (race)
        {
            case RACE_WARRIOR: return "战士族";
            case RACE_SPELLCASTER: return "魔法师族";
            case RACE_FAIRY: return "天使族";
            case RACE_FIEND: return "恶魔族";
            case RACE_ZOMBIE: return "不死族";
            case RACE_MACHINE: return "机械族";
            case RACE_AQUA: return "水族";
            case RACE_PYRO: return "炎族";
            case RACE_ROCK: return "岩石族";
            case RACE_WINDBEAST: return "鸟兽族";
            case RACE_PLANT: return "植物族";
            case RACE_INSECT: return "昆虫族";
            case RACE_THUNDER: return "雷族";
            case RACE_DRAGON: return "龙族";
            case RACE_BEAST: return "兽族";
            case RACE_BEASTWARRIOR: return "兽战士族";
            case RACE_DINOSAUR: return "恐龙族";
            case RACE_FISH: return "鱼族";
            case RACE_SEASERPENT: return "海龙族";
            case RACE_REPTILE: return "爬虫族";
            case RACE_PSYCHO: return "念动力族";
            case RACE_DEVINE: return "幻兽神族";
            case RACE_CREATORGOD: return "创造神族";
            case RACE_WYRM: return "幻龙族";
            case RACE_CYBERSE: return "电子界族";
            case RACE_ILLUSION: return "幻神兽族";
            default: return "";
        }
    }

    public const int LINK_MARKER_BOTTOM_LEFT = 0x001;
    public const int LINK_MARKER_BOTTOM = 0x002;
    public const int LINK_MARKER_BOTTOM_RIGHT = 0x004;
    public const int LINK_MARKER_LEFT = 0x008;
    public const int LINK_MARKER_RIGHT = 0x020;
    public const int LINK_MARKER_TOP_LEFT = 0x040;
    public const int LINK_MARKER_TOP = 0x080;
    public const int LINK_MARKER_TOP_RIGHT = 0x100;

    public static string GetLinkMarkerString(int link)
    {
        string[] markers = { "↙", "↓", "↘", "←", "→", "↖", "↑", "↗" };
        StringBuilder result = new StringBuilder();
        if ((link & LINK_MARKER_BOTTOM_LEFT) != 0) result.Append(markers[0]);
        if ((link & LINK_MARKER_BOTTOM) != 0) result.Append(markers[1]);
        if ((link & LINK_MARKER_BOTTOM_RIGHT) != 0) result.Append(markers[2]);
        if ((link & LINK_MARKER_LEFT) != 0) result.Append(markers[3]);
        if ((link & LINK_MARKER_RIGHT) != 0) result.Append(markers[4]);
        if ((link & LINK_MARKER_TOP_LEFT) != 0) result.Append(markers[5]);
        if ((link & LINK_MARKER_TOP) != 0) result.Append(markers[6]);
        if ((link & LINK_MARKER_TOP_RIGHT) != 0) result.Append(markers[7]);
        return result.ToString();
    }
}
