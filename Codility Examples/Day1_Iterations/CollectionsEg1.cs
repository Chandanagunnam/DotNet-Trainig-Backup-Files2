using System;
using System.Collections.Generic;

namespace CollectionExample
{
class Program
{
static void Main(string []args)
{
List<string> weekdays=new List<string>();
weekdays.Add("Sunday");
weekdays.Add("Monday");
weekdays.Add("Tuesday");
weekdays.Add("Wednesday");
weekdays.Add("Thursday");
weekdays.Add("Friday");
weekdays.Add("Saturday");
foreach(var item in weekdays)
{
Console.WriteLine(item);
}



}}}
