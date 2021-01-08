using System;
 

public class Solution {
public int greedycanoeist(int[] A,int k) 
{	
int canoes = 0,j=0;
int i=A.Length-1;
while(i>=j)
{
if(A[i]+A[j]<=k)
j+=1;
canoes+=1;
i-=1;
}
return canoes;
}
public static void Main () 
{ 
int []A = {1, 9, 8, 4, 0, 9}; 
int k=3;
Solution s = new Solution();
Console.WriteLine(s.greedycanoeist(A,k));



} 

}