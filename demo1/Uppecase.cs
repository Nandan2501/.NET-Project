using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace demo1
{
    internal class Uppecase
    {
        public static void convertUpper()
        {
            string str, result;
        Console.WriteLine("enter a string");
            str = Console.ReadLine();

            result=str.ToUpper();
            Console.WriteLine(result);
    }
}
}
