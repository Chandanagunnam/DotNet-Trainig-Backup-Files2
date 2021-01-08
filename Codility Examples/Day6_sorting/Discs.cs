using System;
using System.Linq;
// you can also use other imports, for example:
// using System.Collections.Generic;

// you can write to stdout for debugging purposes, e.g.
// Console.WriteLine("this is a debug message");

class Solution {
    class Interval
    {
        public long Left;
        public long Right;
    }
    public int solution(int[] A) {
        // write your code in C# 6.0 with .NET 4.5 (Mono)
        if(A==null || A.Length<1)
        {
            return 0;
        }
        var itervals=new Interval[A.Length];
        for(int i=0;i<A.Length;i++)
        {
            long radius = A[i];
            itervals[i]=new Interval()
            {
                Left=i-radius,
                Right=i+radius
            };
        }
        itervals=itervals.OrderBy(i=>i.Left).ToArray();
        int result=0;
        for(int i=0;i<itervals.Length;i++)
        {
            var right=itervals[i].Right;
            for(int j=i+1;j<itervals.Length&&itervals[j].Left<=right;j++)
            {
                result++;
                if(result>10000000)
                {
                    return -1;
                }
            }
        }
        return result;
    }
}