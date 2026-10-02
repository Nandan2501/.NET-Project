using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp1
{
    internal class Pyramid_patten
    {
        public static void py(string[] args)
        {
            int rows = 5;
            for (int i = 1; i <= rows; i++)
            {
                // Print spaces
                for (int j = i; j < rows; j++)
                {
                    Console.Write(" ");
                }
                // Print stars
                for (int k = 1; k <= (2 * i - 1); k++)
                {
                    Console.Write("*");
                }
                Console.WriteLine();
            }
        }
    }
}
