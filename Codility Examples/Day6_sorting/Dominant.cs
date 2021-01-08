using System; 
using System.Linq; 
namespace DominantMember
{

class Program
{

static void Main(string [] args)

{

int [] A = {3,67,4,67,67,67,67,7,8}; 

var group = A.GroupBy(x => x);

var repeated = group.OrderByDescending(x => x.Count()).First();

if (repeated.Count()>A.Length/2)

{

Console.WriteLine(repeated.Key);

}

else 

{

Console.WriteLine(-1);

}

}
}

}