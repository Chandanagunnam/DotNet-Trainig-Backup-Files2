using System; 
  
class Solution 
{ 
static int solution(int []A, int x) 
    { 
   
        int min_len = A.Length + 1; 
  
        for (int i = 0; i < A.Length; i++) 
        { 
           
            int sum = A[i]; 
  
          
            if (sum > x) 
                return 1; 
  
           
            for (int j = i + 1;j < A.Length; j++) 
            { 
               
                sum += A[j]; 
  
               
                if (sum > x &&(j - i + 1) < min_len) 
                    min_len = (j - i + 1); 
            } 
        } 
        return min_len; 
    } 
      
    static public void Main () 
    { 
        int []A = {1, 4, 45,6, 10, 19}; 
        int x = 51; 
        Console.WriteLine(solution(A, x));
}
}