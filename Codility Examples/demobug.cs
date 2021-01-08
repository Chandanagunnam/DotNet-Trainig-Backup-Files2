using System;
namespace demo2
{
class Solution
 {
    public static int solution(int[] A) 
{
        int ans = 0;
        for (int i = 1; i <= A.Length; i++)
 {
            ans = ans + A[i];
        }
        return ans;
    }
static void Main()
{
int []A ={-1,-2,9,7};
Console.Write(solution(A));
}
}
}