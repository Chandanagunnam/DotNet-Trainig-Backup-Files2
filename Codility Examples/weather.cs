using System;
namespace temp
{
class Solution 
{
public string solution(int[] T)
{
int n=T.Length/4;
int h=T.Length/2;
int th=3*T.Length/4;
int[] win={};
int[] sp={};
int[] su={};
int[] Au={};
for(int i=0;i<n & n<h & h<th & th<T.Length;i++,n++,h++,th++)
{
win[i]=T[i];
sp[i]=T[n];
su[i]=T[h];
Au[i]=T[th];
}
int WinMax = win.Max();
int suMax = su.Max();
int spMax = sp.Max();
int AuMax = Au.Max();
int WinMin = win.Min();
int suMin= su.Min();
int spMin = sp.Min();
int AuMin = Au.Min();
int WinAmp = WinMax-WinMin;
int spAmp =spMax-spMin;
int suAmp = suMax-suMin;
int AuAmp = AuMax-AuMin;
if(WinAmp>spAmp && WinAmp>suAmp && WinAmp>AuAmp)
return "winter";
if(spAmp>WinAmp && spAmp>suAmp && spAmp>AuAmp)
return "spring";
if(suAmp>spAmp && suAmp>WinAmp && suAmp>AuAmp)
return "summer";
if(AuAmp>spAmp && AuAmp>suAmp && WinAmp<AuAmp)
return "autumn";
}

static void Main(string []args)
{
int[] T = {-2,9,-3,7,8,3,16,-2,9,5,-1,5};
Console.Write(Solution.solution(T));
}
}
}