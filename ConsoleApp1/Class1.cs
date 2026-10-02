using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp1
{
    internal class Terms_of_5_num_sum
    {
        public static void summ(string[] args)
        {
            int sum = 0;
            Console.WriteLine("Enter 5 numbers:");
            for (int i = 0; i < 5; i++)
            {
                int number = Convert.ToInt32(Console.ReadLine());
                sum += number;
            }
            Console.WriteLine("The sum of the entered numbers is: " + sum);
        }
    }
    
    }

