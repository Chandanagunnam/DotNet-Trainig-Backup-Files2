using System;

namespace FactorialExample
{
class Program
{
static void Main(string []args)
{
Console.WriteLine("Enter number");
int n;
bool res = int.TryParse(Console.ReadLine(),out n);
if(res==false)
{
Console.WriteLine("Enter intergers only");
}
int fact=1;
if(n>0)
{
if(n!=1 & n!=0)
{
for(int i=1;i<=n;i++)
{
fact = fact*i;
}
Console.WriteLine("factorial of {1} is {0}",fact,n);
}
else
{
Console.WriteLine("factorial is 1");
}
}
else{
Console.WriteLine("Enter positive number");
}


}
}
}