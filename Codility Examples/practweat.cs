using System;
namespace Weatherproblem
{
class Solution
{
public static string solution(int[] A)
{
int n = A.Length;
int n1= n/4;
int r=0,r1=0;
int mt=int.MinValue;
int i=0,diff;
for(r=0;r<4;r++)
{
for(int j=i;j<n1-1;j++)
{
int k=j;
while(k<n1-1)
{
diff = Math.Abs(A[j]-A[k+1]);
if(mt < diff)
{
mt = diff;
r1=r;
}
k++;


}
}
i = n1;
n1= n1 + n/4;

}
switch(r1)
{
case 0:
return "Winter";
case 1:
return "spring";
case 2:
return "summer";
case 3:
return "autumn";
}
return "Cannot found";
}
static void Main()
{
int[] A={-4,15,20,-10,20,15,10,30,40,1,24,45};
Console.WriteLine(Solution.solution(A));
}
}
}