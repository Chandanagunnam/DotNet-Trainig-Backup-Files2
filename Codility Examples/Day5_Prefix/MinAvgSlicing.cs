using System;
// you can also use other imports, for example:
// using System.Collections.Generic;

// you can write to stdout for debugging purposes, e.g.
// Console.WriteLine("this is a debug message");

class Solution {
    public int solution(int[] A) {
        // write your code in C# 6.0 with .NET 4.5 (Mono)
        int MinIndex=0;
        double MinAvgVal = Double.MaxValue;
        for(int i=0;i<A.Length-2;i++)
        {
            double TwoDigitMin=(A[i]+A[i+1])/2.0;
            if(MinAvgVal>TwoDigitMin)
            {
                MinAvgVal=TwoDigitMin;
                MinIndex=i;
            }
            double ThreeDigitMin=(A[i]+A[i+1]+A[i+2])/3.0;
            if(MinAvgVal>ThreeDigitMin)
            {
                MinAvgVal=ThreeDigitMin;
                MinIndex=i;
            }
        }
        double lastAvg=(A[A.Length-2]+A[A.Length-1])/2.0;
        if(MinAvgVal>lastAvg)
        {
            MinIndex=A.Length-2;
        }
        return MinIndex;
    }
}
