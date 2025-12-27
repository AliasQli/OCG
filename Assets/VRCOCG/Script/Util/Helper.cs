using System;
using UnityEngine;
using VRC.SDK3.Data;

namespace VRCOCG
{
    static public class Helper
    {
        static public string GenerateId(string s, int i = 0)
        {
            // return $"{s}_{GetTimestamp()}_{i + UnityEngine.Random.value}";
            return $"{s}_{Guid.NewGuid()}_{i}";
        }

        static public int AsInt(this DataToken token)
        {
            return (int)token.Number;
        }

        static public long GetTimestamp()
        {
            return DateTimeOffset.UtcNow.ToUnixTimeMilliseconds();
        }

        static public bool VerifyTimestamp(this ref long localTs, long ts, string debugTag = null)
        {
            var now = GetTimestamp();
            if (debugTag != null) 
                Debug.Log($"[{debugTag}] VerifyTimestamp: current ts={localTs}, new ts={ts}, now ts={now}");
            if (localTs <= ts && ts <= now)
            {
                localTs = ts;
                return true;
            }
            return false;
        }

        // static public DataList DoubleListToIntList(this DataList arr)
        // {
        //     DataList res = new DataList();
        //     for (var i = 0; i < arr.Count; i++)
        //     {
        //         res.Add(arr[i].AsInt());
        //     }
        //     return res;
        // }

        // Fisher–Yates shuffle
        static public DataList Shuffle(this DataList arr)
        {
            var gen = new System.Random();
            for (var i = arr.Count - 1; i >= 1; i--)
            {
                var j = gen.Next(i + 1);
                if (i != j)
                {
                    var t = arr[i];
                    arr[i] = arr[j];
                    arr[j] = t;
                }
            }
            return arr;
        }

        static public DataToken Pop(this DataList arr)
        {
            var i = arr.Count - 1;
            var e = arr[i];
            arr.RemoveAt(i);
            return e;
        }

        static public DataToken Unshift(this DataList arr)
        {
            var e = arr[0];
            arr.RemoveAt(0);
            return e;
        }

        static public void Shift(this DataList arr, DataToken e)
        {
            arr.Insert(0, e);
        }
    }
}