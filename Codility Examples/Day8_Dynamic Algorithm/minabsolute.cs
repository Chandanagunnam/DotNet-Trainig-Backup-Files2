using System;
// you can also use other imports, for example:
// using System.Collections.Generic;

// you can write to stdout for debugging purposes, e.g.
// Console.WriteLine("this is a debug message");

class Solution {
    public int solution(int[] A) {
        // write your code in C# 6.0 with .NET 4.5 (Mono)
        if(A.Length==0) 
        return 0;
        if(A.Length==1) 
        return A[0];
        int sum=0;
        for(int i=0;i<A.Length;i++)
        sum+=Math.Abs(A[i]);
        int[]indices=new int[A.Length];
        indices[0]=0;
        int half=sum/2;
        int localSum=Math.Abs(A[0]);
        int minLocalSum=int.MaxValue;
        int placeIndex=1;
        for(int i=1;i<A.Length;i++)
        {
            if(localSum<half)
            {
                if(Math.Abs(2*minLocalSum-sum)>Math.Abs(2*localSum-sum))
                minLocalSum=localSum;
                localSum+=Math.Abs(A[i]);
                indices[placeIndex++]=i;
            }
            else
            {
                if(localSum==half)
                return Math.Abs(2*half-sum);
                if(Math.Abs(2*minLocalSum-sum)>Math.Abs(2*localSum-sum))
                minLocalSum=localSum;
                if(placeIndex>1)
                {
                    localSum-=Math.Abs(A[indices[placeIndex--]]);
                    i=indices[placeIndex];
                }
            }
        }
        return (Math.Abs(2*minLocalSum-sum));
    }
}
