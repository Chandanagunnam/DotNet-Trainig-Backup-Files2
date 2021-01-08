using System;
namespace TraverseArray
{
class Solution
{
public static int solution(int k,int[]A)
{
int sum=A[k];
for(int i=k;i>=0;i--)
{
sum=sum+A[i];
}


for(int i=k+1;i<A.Length;i++)
{
sum=sum+A[i];
}


return sum;
}
static void Main(string []args)
{
int[]A={1,2,3,4,5,6,7,8,9};
Console.WriteLine("Enter Position for K:");
int k=int.Parse(Console.ReadLine());
if(k>A.Length)
{
Console.WriteLine("Please Provide Value within range");
return;
}
Console.WriteLine("Sum:");
Console.WriteLine(Solution.solution(k,A));

}
}
}