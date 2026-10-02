using System;
using System.Collections.Generic;
using System.Linq;


class Program
{
    public static void Main(string[] args)
    {
        int k = 1;
        for (int i = 1; i <= 5; i++) //no. of rows 
        {

            if (i % 2 != 0)
            {
                for (int j = 1; j <= i; j++) //no. of columns 
                {
                    Console.Write(k + " ");
                    k++;
                }
                Console.WriteLine();
            }
            else
            {
                int w = k + i - 1;
                for (int j = 1; j <= i; j++) //no. of columns 
                {
                    Console.Write(w + " ");
                    w--;
                }
                Console.WriteLine();
                k += i;
            }
        }
    }


}
