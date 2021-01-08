using System;
namespace FrogJump
{
class DynamicAlgorith
{
public int []solution(int []S,int k,int q)
{
n=S.Length;
int[]dp=new int[n];
dp[0]=S[1]+S[0]*k;
for(int j=1;j<k+1;j++)
for(int i=0;i<n;i++)
if(S[i]<=j)
dp[j]=(dp[j]+dp[j-S[i]])%q;
return dp[k];
}
static void Main()
{
int []S={1,2,3,5,8,13,21,34,55,89,144,233,610,987,1597,2584,4181,6765,10946,17711,28657,46368,75025};
int k=50;
int q=2;
var res= new DynamicAlgorith(S,k,q);
Console.WriteLine(res);
}
}}
