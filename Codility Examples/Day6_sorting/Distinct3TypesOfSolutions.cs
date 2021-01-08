using System;
// you can also use other imports, for example:
// using System.Collections.Generic;

// you can write to stdout for debugging purposes, e.g.
// Console.WriteLine("this is a debug message");

class Solution {
    public int solution(int[] A) {
        // write your code in C# 6.0 with .NET 4.5 (Mono)
        int n=A.Length;
        if(n==0)
        {
            return 0;
        }
        else
        {
            Array.Sort(A);
            int result=1;
            for(int i=1;i<n;i++)
            {
                if(A[i]!=A[i-1])
                result++;
            }
            return result;
        }
}
}


-------------------------------------------------
using System;

class Solution {
	public int solution(int[] A) {
		int count = A.Length > 0 ? 1 : 0;
		if (A.Length > 1) {
			Array.Sort(A);
			int current = A[0];
			for (var i = 0; ++i < A.Length;)
				if (current != A[i]) {
					++count;
					current = A[i];
				}
		}
		return count;
	}
}
--------------------------------------
class Solution {
    public int solution(int[] A) {
        int [] newA = A.Distinct().ToArray();
        if (A.Length <=0) return 0;
        else return newA.Length;
    }
}
