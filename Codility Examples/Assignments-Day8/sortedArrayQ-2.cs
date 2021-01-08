//1st and last position of element in sorted array

using System;

namespace FirstAndLastElement
{
class Program
{
static void Main(string []Args)
{
int []A={5,5,5,6,7,8,8,9,10,11,12,12};
int first=0,last=0,target=5;
for(int i=0;i<A.Length;i++)
{
if(A[i] == target)
{
first=i;
for(int j=i+1;j<A.Length;j++)
{
if(A[i]==A[j])
{
last=j;
}
}
break;
}
else
{
first=-1;
last=-1;
}
}
Console.WriteLine("First Occurence {0}",first);
Console.WriteLine("Last Occurence {0}",last);

}}}