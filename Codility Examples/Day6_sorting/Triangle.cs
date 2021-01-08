using System;
// you can also use other imports, for example:
// using System.Collections.Generic;

// you can write to stdout for debugging purposes, e.g.
// Console.WriteLine("this is a debug message");

class Solution {
    public int solution(int[] A) {
        // write your code in C# 6.0 with .NET 4.5 (Mono)
        Array.Sort(A);
int n =A.Length;
int result=0;
if(n<3)
return 0;

for (int i=0; i< n-2;i++)
{
long a =A[i];
long b=A[i+1];
long c =A[i+2];

if(a+b>c)
{
result =1;
break;
}
else 
{
result=0;
}
}
return result;
    }
}