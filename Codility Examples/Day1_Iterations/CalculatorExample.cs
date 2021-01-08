/*Write a program which take i/p of two numbers and an character operater (+,-,*,/)and perform the calculator operation*/

using System;
namespace Calculator
{
class Program
{
static void Main(string []args)
{
int a, b;
char op;    
Console.Write("operation: ");
op= char.Parse(Console.ReadLine());
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
            if (op == '+')
                Console.WriteLine("Addition{0}", a + b);
            else if (op == '-')
                Console.WriteLine("Subtraction{0}", a - b);
            else if (op == '*')
                Console.WriteLine("Multipley {0}", a * b);
            else if (op == '/')
            {
                float c;
                float.TryParse(a / b,out c);
                Console.WriteLine("Division{0}", c);
            }
            else
                Console.WriteLine("Enter proper operator");
}
}
}





