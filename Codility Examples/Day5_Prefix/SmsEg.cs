using System;
namespace SMS
{
class Solution
{
public static int solution(string s,int k)
{
    string longs="";
    int count=0;
    string[] slist=s.Split(' ');
    string[] slist2=new string[2*slist.Length-1];
    for(int i=0;i<slist.Length;i++)
    {
        if(i==slist.Length-1)
        {int j=2*i;
        slist2[j]=slist[i];}
        else
        {int j=2*i;
        slist2[j]=slist[i];
        slist2[j+1]=" ";}

 

    }

 

///foreach(var i in slist2)
///{Console.WriteLine(i+"//");}

 

 

    for(int i=0;i<slist2.Length;i++)
    {
        longs=longs+slist2[i];
        if(longs.Length==k)
        {
            Console.WriteLine(longs);
            count++;
            longs="";
        }
        else if(longs.Length>k)
        {
            Console.WriteLine(longs);
            count++;
            longs="";
            i--;
        }
        else if(i==(slist2.Length-1))
        {Console.WriteLine(longs);return count+1;}
        

 

    }
return count;
}
static void Main()
{
string s="SMS messages are really short";
int k=12;
Console.WriteLine(solution(s,k));
}
}
}
 