using System;

namespace MushroomPicker
{
class Solution
{
public static int CalcSum(int []prefix,int left,int right)
{
return prefix[right]-prefix[left];
}
public static int MaxMushroom(int []A,int k, int m)
{
int [] prefix=new int [A.Length];
prefix[0]=A[0];
for(int i=1;i<A.Length;i++)
prefix[i]=prefix[i-1]+A[i];
int result=0;
for(int i=0;i<Math.Min(m,k);i++)
{
int left=k-i;
int right=Math.Min(Math.Max(k+m-2*i,k),A.Length-1);
result=Math.Max(result,CalcSum(prefix,left,right));
}
for(int i=0;i<Math.Min(A.Length-k,m+1);i++)
{
int left=Math.Max(0,Math.Min(k-(m-2*i),k));
int right=k+i;
result=Math.Max(result,CalcSum(prefix,left,right));
}
return result;
}
static void Main(string []args)
{
int []A={2,3,7,5,1,3,9};
int k=4;
int m=6;
Console.WriteLine(MaxMushroom(A,k,m+1));
}
}
}