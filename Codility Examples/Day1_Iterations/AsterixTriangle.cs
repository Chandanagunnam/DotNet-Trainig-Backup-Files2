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
for(i=1;i<=n;i++)//outer loop .till it reaches n it should iterate
{
//every value of i it should print equal number of asterix
for(j=1;j<=i;j++) 
{
Console.Write("*");
}
Console.WriteLine(" ");//starts new row in newline
}//closing outer for loop

}//else block closing


}
}
}