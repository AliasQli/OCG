using UdonSharp;
using UnityEngine;
using VRC.SDK3.Data;

namespace VRCOCG
{
    public class Registry : UdonSharpBehaviour
    {
        private readonly DataDictionary dict = new DataDictionary();

        public void Register(string uid, Object obj)
        {
            dict.Add(uid, obj);
        }

        public void Unregister(string uid)
        {
            dict.Remove(uid);
            // assert return true
        }

        // Nullable
        public Object TryGet(string uid)
        {
            if (dict.TryGetValue(uid, TokenType.Reference, out DataToken obj)) // ?
            {
                return (Object)obj.Reference;
            }
            else
            {
                return null;
            }
        }
    }
}
