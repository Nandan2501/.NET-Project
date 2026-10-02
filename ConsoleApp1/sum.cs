using System;
using System.Collections.Generic;
using System.Text;

namespace s2
{
    internal class sum
    {
        static void nnn(string[] args)
        {
            int a = 0;
            int b = 1;
            Console.Write(a);
            Console.Write(b);
            for (int i = 0; i < 5; i++)
            {
                int c = a + b;
                Console.Write(c);
                a = b;
                b = c;
            }
        }
    }
}