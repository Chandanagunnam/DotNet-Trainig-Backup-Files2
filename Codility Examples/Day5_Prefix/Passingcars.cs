using System;
// you can also use other imports, for example:
// using System.Collections.Generic;

// you can write to stdout for debugging purposes, e.g.
// Console.WriteLine("this is a debug message");

class Solution {
    public int solution(int[] A) {
        // write your code in C# 6.0 with .NET 4.5 (Mono)
        int count=0;
        int multiply=0;
        foreach(int car in A)
        {
            if(car==0)
            {
                multiply=multiply+1;
            }
            if(multiply>0)
            {
                if(car==1)
                {
                    count=count+multiply;
                    if(count>1000000000)
                    {
                        return -1;
                    }
                }
            }
    
        }
        return count;
    }
}
