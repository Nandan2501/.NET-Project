using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp1
{
    internal class Floyd_num_patten
    {
        public static void floyd(string[] args)
        {
            int rows = 5;
            int number = 1;
            for (int i = 1; i <= rows; i++)
            {
                for (int j = 1; j <= i; j++)
                {
                    Console.Write(number + " ");
                    number++;
                }
                Console.WriteLine();
            }
        }
    }
}
