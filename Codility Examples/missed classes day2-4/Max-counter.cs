using System;
// you can also use other imports, for example:
// using System.Collections.Generic;

// you can write to stdout for debugging purposes, e.g.
// Console.WriteLine("this is a debug message");

class Solution {
    public int[] solution(int N, int[] A) {
        // write your code in C# 6.0 with .NET 4.5 (Mono)
        int []counter=new int[N];
        int n=A.Length;
        int max=-1;
        int current_min=0;
        for(int i=0;i<n;i++)
        {
            if(A[i]>=1 && A[i]<=N)
            {
                if(counter[A[i]-1]<current_min)
                counter[A[i]-1]=current_min;
                counter[A[i]-1]=counter[A[i]-1]+1;
                if(counter[A[i]-1]>max)
                max=counter[A[i]-1];
            }
            else if(A[i]==N+1)
            {
                current_min=max;
            }
        }
        for(int i=0;i<N;i++)
        {
            if(counter[i]<current_min)
            counter[i]=current_min;
        }
        return counter;
        }
    
}
