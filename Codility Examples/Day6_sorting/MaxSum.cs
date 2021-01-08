using System;
// you can also use other imports, for example:
// using System.Collections.Generic;

// you can write to stdout for debugging purposes, e.g.
// Console.WriteLine("this is a debug message");

class Solution {
    public int solution(int[] A) {
        // write your code in C# 6.0 with .NET 4.5 (Mono)
        Array.Sort(A);
      int a= A[A.Length-1]*A[A.Length-2]*A[A.Length-3];
        int b=0;
        if(A[0]<0 && A[1] < 0) 
        b=A[0]*A[1]*A[A.Length-1];

        if(b>a &&(A[0]<0 && A[1] < 0)) return b;
        else return a;
       
    }
}