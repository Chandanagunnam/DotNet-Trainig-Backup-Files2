using System;
 

public class Solution {
public static void MoveZeroes(int[] A) 
{	
int index = 0;
for(int i = 0; i < A.Length; i++)
{

if(A[i] == 0) 
continue;
           
if(index != i)
{
A[index] = A[i];
A[i] = 0;
}
index++;
}
}
public static void Main () 
{ 
int []A = {1, 9, 8, 4, 0, 0, 2, 7, 0, 6, 0, 9}; 
MoveZeroes(A); 
Console.WriteLine("After moving Zeroes"); 
for (int i = 0; i < A.Length; i++) 
Console.Write(A[i] +" "); 
} 

}