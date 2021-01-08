using System;
class Solution{
public int solution(string S)
{
int n = S.Length;
int x=0,y=0;
if(n==2)
{
int num = Convert.ToInt32(S);
return num;

}
for(int i=0;i<n-1;i++)
{
int j=2;
string dig = S.Substring(i,j);
x=Convert.ToInt32(dig);
if(x>y)
{
y=x;
}
}
return y;
}