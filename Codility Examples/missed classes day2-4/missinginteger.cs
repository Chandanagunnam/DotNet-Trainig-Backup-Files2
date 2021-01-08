class Solution {
    public int solution(int[] A) {
        // write your code in C# 6.0 with .NET 4.5 (Mono)
        int sm=1;
        if(A.Length==0)
        {
            return sm;
        }
        Array.Sort(A);

 

    if(A[0]>1){return sm;}
    if(A[A.Length-1]<=0) {return sm;}

 

        for(int i=0;i<A.Length;i++)
        {
            if(A[i]==sm)
            {
                sm++;
            }
        }
        return sm;
    }
}