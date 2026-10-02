using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace demo1
{
    internal class Mobile_num
    {
        public static void HideNo()
        {
            string str;
            //string result = "";
            Console.WriteLine("enter a mobile no.");
            str = Console.ReadLine();
            int n =str.Length;

            for (int i = 0; i < n; i++)
            {
                if(i<5 )
                { Console.Write(str[i]);
                }
                else
                { Console.Write("x");
                }
            }
        }
    }
}
