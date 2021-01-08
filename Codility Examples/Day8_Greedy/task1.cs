public int solution(int[]A,int []B)
{
int n=A.Length;
if(n<=1)
return n;
int cnt=1;
int prev_end=B[0];
int curr;
for(curr=1;curr<n;curr++)
{
if(A[curr]>prev_end)
{
cnt++;
prev_end=B[curr];

}
}
return cnt;
}