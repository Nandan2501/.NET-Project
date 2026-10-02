using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace demo1
{
    internal class ToggelCase
    {
        public static void convertToggel()
        {
            string str, result;
            Console.WriteLine("enter a string");
            str = Console.ReadLine();
            result = new string(str.Select(c => char.IsUpper(c) ? char.ToLower(c) : char.ToUpper(c)).ToArray());
            Console.WriteLine(result);
        }
    }
}
