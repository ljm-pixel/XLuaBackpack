using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using XLua;

public static class CsharpCallLuaList
{
    //不为系统类添加特性也能用，用点奇怪
    [CSharpCallLua]
    public static List<Type> csharpCallLuaList = new List<Type>()
    {
        typeof(UnityAction<float>)
    };

    [LuaCallCSharp]
    public static List<Type> luaCallCsharpList = new List<Type>()
    {
        typeof(GameObject)
    };
}
