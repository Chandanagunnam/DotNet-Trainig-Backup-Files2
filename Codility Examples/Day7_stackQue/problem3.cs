using System;
// you can also use other imports, for example:
// using System.Collections.Generic;

// you can write to stdout for debugging purposes, e.g.
// Console.WriteLine("this is a debug message");

class Solution {
    public int solution(string S) {
        // write your code in C# 6.0 with .NET 4.5 (Mono)
        int open=0;
        foreach(var c in S)
        if((open +=c=='(' ? 1: -1)< 0)
        break;
        return open == 0 ?1:0;
    }
}
