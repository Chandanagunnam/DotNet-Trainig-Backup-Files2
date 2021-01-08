/* Print 2 table upto 2*10 */

using System;
namespace ForExample
{
class Program
{
static void Main(string []args)
{
int num;
Console.WriteLine("Enter a Number");
bool Res = int.TryParse(Console.ReadLine(),out num);
if(Res==false)
{
Console.WriteLine("Enter Numbers only");
return;
}
int max;
Console.WriteLine("Enter max num");
Res = int.TryParse(Console.ReadLine(),out max);
if(Res==false)
{
Console.WriteLine("Enter Numbers only");
return;
}
for(int i=1; i <=max; i++)
{
Console.WriteLine("{0} * {1} = {2}",num,i,(num*i));
}
}
}
}