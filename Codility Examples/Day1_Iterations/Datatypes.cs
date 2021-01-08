using System;
namespace DatatypesExample
{
class Program
{
static void Main(string []args)
{
int empid;
string name;
string dept;
double salary;
Console.WriteLine("Enter Employee ID:");
bool result=int.TryParse(Console.ReadLine(),out empid);
if(result==false)
{
Console.WriteLine("Enter only numbers");
return;//go back to the calling function
}
Console.WriteLine("Enter Name:");
name=Console.ReadLine();
Console.WriteLine("Enter Department Name:");
dept=Console.ReadLine();
Console.WriteLine("Enter Salary:");
bool Res=double.TryParse(Console.ReadLine(),out salary);
if(Res==false)
{
Console.WriteLine("Enter numbers");
return;//go back to calling function
}
Console.WriteLine("Employee ID:"+empid);
Console.WriteLine("Name:"+name);
Console.WriteLine("Dept:"+dept);
Console.WriteLine("Salary"+salary);
}
}
}