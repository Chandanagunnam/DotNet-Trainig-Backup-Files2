using System;
namespace WhileLoop
{
class Program
{
static void Main(string [] args)
{

string prodname;
int qty;
int price;
int totalamt;
int finalamt = 0;
char ans;
Console.WriteLine("Do you want to buy? Enter Y or N");
ans=char.Parse(Console.ReadLine());

while(ans=='Y')
{
Console.WriteLine("Please Enter Product Name");
prodname= Console.ReadLine();
Console.WriteLine("Enter Quantity Required");
qty= int.Parse(Console.ReadLine());
Console.WriteLine("Enter price");
price= int.Parse(Console.ReadLine());
totalamt = (qty*price);
finalamt+=totalamt;
Console.WriteLine("Do you want to buy again? Enter Y or N");
ans=char.Parse(Console.ReadLine());
if(ans=='N')
{
Console.WriteLine("Final amount to be paid is:{0}",finalamt);
}
}
}
}
}