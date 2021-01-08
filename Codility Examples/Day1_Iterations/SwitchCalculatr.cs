using System;
namespace CalculatorUsingSwitch
{
class Program
{
static void Main(string []args)
{
int a,b;
char op;
Console.Write("Enter a ");
bool result=int.TryParse(Console.ReadLine(),out a);
if(result==false)
{
Console.WriteLine("Enter only numbers");
return;
}
Console.Write("Enter b ");
result=int.TryParse(Console.ReadLine(),out b);
if(result==false)
{
Console.WriteLine("Enter only numbers");
return;
}
Console.Write("Enter operator");
result=Char.TryParse(Console.ReadLine(),out op);
if(result==false)
{
Console.WriteLine("Enter only Characters");
return;
}

switch(op)
{
case '+':
Console.WriteLine("Addition {0}", a+b);
break;
case '-':
Console.WriteLine("Subtract {0}", a-b);
break;
case '*':
Console.WriteLine("Multiply {0}", a*b);
break;
case '/':
Console.WriteLine("Division {0}", a/b);
break;
default:
Console.WriteLine("Enter Proper Operator");
break;
}
}
}
}