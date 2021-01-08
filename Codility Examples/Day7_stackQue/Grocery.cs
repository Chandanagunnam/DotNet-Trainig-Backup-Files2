using System;

class Solution {
  public int Grocery_Store(int []A)
{
int n=A.Length;
int size=0;
int result=0;
for(int i=0;i<n;i++)
{
if(A[i]==0)
size+=1;
else
size-=1;
result=Math.Max(result,-size);
}
return result;
}
public static void Main() 
{ 
    Solution s=new Solution();
int []A={1,0,1,0,0};
int []B={1,1,0,0,0,1,1,1};
int []C={0,0,0,0,0};
int []D={1,1,1,1,1};
Console.WriteLine(s.Grocery_Store(A));
Console.WriteLine(s.Grocery_Store(B));
Console.WriteLine(s.Grocery_Store(C));
Console.WriteLine(s.Grocery_Store(D));
} 
}