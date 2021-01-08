using System;
using System.Collections.Generic;
namespace twosum
{
class Solution
{
List<int> A=new List<int>();
public void Add(int a)
{
A.Add(a);
}
public bool Find(int target)
{
bool result=false;
for(int i=0; i<A.Count; i++)
{
for(int j=0; j<A.Count; j++)
{
if(A[i]+A[j]==target && i!=j)
{
result=true;
break;
}
}
}
return result;
}
}
class Program
{
static void Main()
{
Solution s= new Solution();
s.Add(4);
s.Add(1);
s.Add(3);
s.Add(5);
Console.WriteLine(s.Find(6));
}
}
}