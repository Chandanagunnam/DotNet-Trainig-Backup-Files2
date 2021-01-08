using System;

namespace TwoSum
{
class Program
{
static void Main()
{
int []A={4,7,5,8,2};
int target=11;
int a=0,b=0;
for(int i=0;i<A.Length;i++)
{
for(int j=i+1;j<A.Length;j++)
{
if(A[j] + A[i] == target)
{
a = Array.IndexOf(A,A[i]);
b= Array.IndexOf(A,A[j]);
Console.WriteLine("{0}  and {1}",a,b);
}
}
}

}}}