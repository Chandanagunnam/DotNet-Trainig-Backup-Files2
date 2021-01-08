using System.Collections.Generic;
using System.Linq;
class Solution {
    public int solution(int X, int[] A) {
        int [] B = A.Distinct().ToArray();        
        return (B.Length != X)? -1 : Array.IndexOf(A, B[B.Length-1]);
    }
}