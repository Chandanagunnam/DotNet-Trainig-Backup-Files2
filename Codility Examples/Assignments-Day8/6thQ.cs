using System; 
using System.Collections.Generic; 
  
class LTI 
{ 
  
// method checks if character is  
// parenthesis(open or closed) 
static bool isParenthesis(char c) 
{ 
    return ((c == '(') || (c == ')')); 
} 
  
// method returns true if string contains  
// valid parenthesis 
static bool isValidString(String str) 
{ 
    int cnt = 0; 
    for (int i = 0; i < str.Length; i++) 
    { 
        if (str[i] == '(') 
            cnt++; 
        else if (str[i] == ')') 
            cnt--; 
        if (cnt < 0) 
            return false; 
    } 
    return (cnt == 0); 
} 
  
// method to remove invalid parenthesis 
static void removeInvalidParenthesis(String str) 
{ 
    if (str == null || str == "") 
        return; 
  
    // visit set to ignore already visited string 
    HashSet<String> visit = new HashSet<String>(); 
  
    // queue to maintain BFS 
    Queue<String> q = new Queue<String>(); 
    String temp; 
    bool level = false; 
  
    // pushing given string as  
    // starting node into queue 
    q.Enqueue(str); 
    visit.Add(str); 
    while (q.Count != 0) 
    { 
        str = q.Peek(); q.Dequeue(); 
        if (isValidString(str)) 
        { 
            Console.WriteLine(str); 
  
            // If answer is found, make level true 
            // so that valid string of only that level 
            // are processed. 
            level = true; 
        } 
          
        if (level) 
            continue; 
        for (int i = 0; i < str.Length; i++) 
        { 
            if (!isParenthesis(str[i])) 
                continue; 
  
            // Removing parenthesis from str and 
            // pushing into queue,if not visited already 
            temp = str.Substring(0, i) +  
                   str.Substring(i + 1); 
            if (!visit.Contains(temp)) 
            { 
                q.Enqueue(temp); 
                visit.Add(temp); 
            } 
        } 
    } 
} 
  
// Driver Code 
public static void Main(String[] args)  
{ 
    String expression = "()())()"; 
    removeInvalidParenthesis(expression); 
  
    expression = "()v)"; 
    removeInvalidParenthesis(expression); 
} 
}