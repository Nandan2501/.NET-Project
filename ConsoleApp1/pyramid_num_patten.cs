using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp1
{
    internal class pyramid_num_patten
    {
        public static void pyp(string[] args)
        {
            int rows = 5;
            for (int i = 1; i <= rows; i++)
            {

                for (int j = i; j < rows; j++)
                {
                    Console.Write(" ");
                }

                for (int k = 1; k <= (2 * i - 1); k++)
                {
                    Console.Write(k);
                }
                Console.WriteLine();
            }
        }
    }
}
