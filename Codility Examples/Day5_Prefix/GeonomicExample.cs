class Solution { public int[] solution(String S, int[] P, int[] Q)
{
int N=S.Length;
int M=P.Length;
char []chars={'A','C','G','T'};

 

//calculate the accumulation
//2-4, C to G , accumulates 2 times
//5-5 , T , accumulates 5
//0-6 , A , accumulates 1
int [,]accum=new int[3,N+1];
for(int i=0;i<=2;i++)
{
for(int j=0;j<N;j++)
{
if(S[j]==chars[i])
  accum[i,j+1]=accum[i,j]+1;
else
   accum[i,j+1]=accum[i,j];
}
}
//Get the nucloids for the given range of value
int diff;
int []minimums=new int[M];
for(int i=0;i<M;i++)
{
minimums[i]=4;
for(int j=0;j<=2;j++)
{
diff=accum[j,Q[i]+1]-accums[j,P[i]);
if(diff > 0)
{
minimums[i]=j+1;
break;
}
}
}
return minimums;
}
static void Main(string []args)
{
string S="CAGCCTA";
int []P={2,5,0};
int []Q={4,5,6};
var res=new Solution().solution(S,P,Q);
foreach(var r in res)
  Console.Write(r + ",");
}
var res=new Solution().solution(
}
}
}
}