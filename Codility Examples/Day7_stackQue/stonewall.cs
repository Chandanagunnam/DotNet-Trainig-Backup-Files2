using System;
using System.Collections.Generic;
// you can also use other imports, for example:
// using System.Collections.Generic;

// you can write to stdout for debugging purposes, e.g.
// Console.WriteLine("this is a debug message");

class Solution {
    public int solution(int[] H) {
        // write your code in C# 6.0 with .NET 4.5 (Mono)
        int blocks=1;
        var stack=new Stack<int>();
        stack.Push(H[0]);
        for(var i=0;++i<H.Length;)
        {
            int height=H[i];
            while(stack.Count>0 && stack.Peek()>height)
            stack.Pop();
            if(stack.Count==0||stack.Peek()!=height)
            {
                stack.Push(height);
                ++blocks;
            }
        }
        return blocks;
    }
}