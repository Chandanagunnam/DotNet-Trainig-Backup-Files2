using System;
namespace TriangleEg
{
class Program
{
static void Main(string []args)
{
int n;
Console.WriteLine("Enter no. of rows to be printed");
bool res=int.TryParse(Console.ReadLine(),out n);

if(res==false)
{
Console.WriteLine("Enter int");
return;
}

for(int i=1;i<=n;i++)
{
for(int j=1;j<=n-1;j++)
{
Console.Write("  ");
}
for(int k=1;k<=i;k++)
{
Console.Write(" * ");
}

Console.WriteLine(" ");
}

}
}
}