using System;
using System.Collections.Generic;

namespace BinaryGapEg
{

class Solution
{
public int answer(int n)
{
//algorithm
int longest=0,count=0,finalcount=0;

string bits=Convert.ToString(n,2);
Console.WriteLine("{0}",bits);
for(int i=0;i < bits.Length;i++)
{
if(bits[i]=='0')
{
if(count>0)

count++;

else

count=1;

}
else

count=0;

if(count>longest)

longest=count;
if(bits[i]=='1' && longest>finalcount)
finalcount=longest;
}
return finalcount;
}
}
class Program
{
static void Main(string []args)
{
//object of class Solution
Solution S = new Solution();
//method is answer
Console.WriteLine(S.answer(7));
Console.WriteLine(S.answer(19));
Console.WriteLine(S.answer(32));
Console.WriteLine(S.answer(47));
Console.WriteLine(S.answer(20));
Console.WriteLine(S.answer(755));
}
}
}

