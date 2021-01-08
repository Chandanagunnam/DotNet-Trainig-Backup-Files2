using System;
namespace ProductPurchaseEg
{
class Program
{
static void Main(string []args)
{
string ProductName;
int qty;
float ProductPrice,TotalPrice;
float FinalAmt = 0;
char ans;
Console.WriteLine("Do You want to Purchase ?  Enter Your Answer: Y or N");
ans=char.Parse(Console.ReadLine());

while(ans=='Y' || ans=='y')
{
Console.WriteLine("Enter Productname");
ProductName = Console.ReadLine();
Console.WriteLine("Enter Quantity");
var Res = int.TryParse(Console.ReadLine(),out qty);
if(Res==false)
{
Console.WriteLine("Enter Quantity in numbers");
}
Console.WriteLine("Enter Productprice");
Res = float.TryParse(Console.ReadLine(),out ProductPrice);
if(Res==false)
{
Console.WriteLine("Enter ProductPrice in numbers");
}
TotalPrice=(qty*ProductPrice);
FinalAmt= (FinalAmt + TotalPrice);
Console.WriteLine("Do You want to Purchase ?  Enter Your Answer: Y or N");
ans=char.Parse(Console.ReadLine());
if(ans=='N' || ans=='n')
{
Console.WriteLine("FinalAmount  {0} ",FinalAmt);
}
}


}
}
}