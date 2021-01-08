using System;
namespace NumOfDigits
{
class Program
{
static void Main(string []args)
{
int n,count=0;
Console.WriteLine("Enter n");
bool Res = int.TryParse(Console.ReadLine(),out n);
if(Res==false)
{
Console.WriteLine("Enter int only");
return;
}
while(n!=0)
{
n = (n/10);
count ++;
}
Console.WriteLine("Number of digits {0}",count);
}
}
}