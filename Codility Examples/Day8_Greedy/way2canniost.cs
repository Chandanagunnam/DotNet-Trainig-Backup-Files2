public int greedyCanoeistB(int []W,k)
{
int canoes=0;
int j=0;
i=W.Length-1;
while(i>=j)
{
if(W[i]+W[j]<=k)
{
j=j+1;
}
canoes+=1;
i=i-1;
return canoes;
}
}