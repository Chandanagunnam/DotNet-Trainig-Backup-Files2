using System;
namespace fibonacci
{
class Program
{
static void Main(string []args)
{
int a=0,b=1,i=3,c,n;
Console.WriteLine("Enter last num");
n = int.Parse(Console.ReadLine());
Console.WriteLine("{0}",a);
Console.WriteLine("{0}",b);
while(i<=n)
{
c=a+b;
Console.WriteLine("{0}",c);
a=b;
b=c;
i++;
}


}}}