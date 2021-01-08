using System;
namespace AsterixEgUsingFor
{
class Program
{
static void Main(string []args)
{
int n,i,j;
Console.WriteLine("Enter +ve no");
var res= int.TryParse(Console.ReadLine(),out n);
if(res==false)
{
Console.WriteLine("Enter no only");
return;
}
if(n <=0)
{
Console.WriteLine("Enter +ve no only");
return;
}
else
{
for(i=n;i>=1;i--)
{

for(j=1;j<=i;j++) 
{
Console.Write("*");
}
Console.WriteLine(" ");

}
}


}
}
}