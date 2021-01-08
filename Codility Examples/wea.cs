using  System;
namespace TempAmplitude
{
class Solution
{
public static string  solution(int[] A)
{
int n=A.Length;
int  n1=n/4,r=0,r1=0,mt=int.MinValue,i=0,diff;
	for(r=0;r<4;r++)
	{
		for(int j=i;j<n1-1;j++)
		{
			int k=j;
			while(k<n1-1)
			{
				diff=Math.Abs(A[j]-A[k+1]);
				if(mt<diff)
				{mt=diff;r1=r;}
				k++;
			}

		}
		i=n1;
		n1=n1+n/4;

	}

switch(r1)
{
case 0:
	return "WINTER";

case 1:
	return "SPRING";
case 2:
	return "SUMMER";
case 3:
	return "AUTUMN";
}
return "Not Able to Find";
}
static void Main()
{
int[] A={-4,15,20,-10,20,15,10,30,40,1,24,45};
Console.WriteLine(Solution.solution(A));
}
}
}