using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp1
{
    internal class Armstrong_num
    {
        public static void jaj(string[] args)
        {
            Console.Write("Enter a number: ");
            int number = Convert.ToInt32(Console.ReadLine());
            int sum = 0;
            int temp = number;
            while (temp != 0)
            {
                int digit = temp % 10;
                sum += digit * digit * digit;
                temp /= 10;
            }
            if (sum == number)
            {
                Console.WriteLine("{0} is an Armstrong number.", number);
            }
            else
            {
                Console.WriteLine("{0} is not an Armstrong number.", number);
            }
        }
    }
}
