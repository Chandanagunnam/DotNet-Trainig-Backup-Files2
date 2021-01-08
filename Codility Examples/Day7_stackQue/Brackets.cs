using System;
using System.Collections.Generic;
public int solution(String S)
{
Stack<char> stack=new Stack<char>();
for(int i=0;i<S.Length;i++)
{
char c=S[i];
switch(c)
{
case ')':
if(stack.Count==0 || stack.Pop()!='(')
return 0;
break;
case ']':
if(stack.Count==0 || stack.Pop()!='[')
return 0;
break;
case '}':
if(stack.Count==0 || stack.Pop()!='{')
return 0;
break;
default:
stack.Push(c);
break;
}}
return stack.Count==0?1:0;
}
-------------------------
way 2




using System;
using System.Collections.Generic;

class Solution {
	public int solution(string S) {
		const string opening = "({[", closing = ")}]";
		var stack = new Stack<int>();
		int p;
		foreach (var c in S)
			if ((p = opening.IndexOf(c)) != -1)
				stack.Push(p);
			else if (stack.Count == 0 || stack.Pop() != closing.IndexOf(c))
				return 0;
		return stack.Count == 0 ? 1 : 0;
	}
}