using System;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] arr = { 1, 2, 3, 5, 25, 7, 5, 2, 4, 6, 8, 3, 8, 9, 2, 6, 8};
         
            
            arr.Sort();
            for (int i = 0; i < arr.Length; i++)
            {
                Console.Write(arr[i] +" "); 
            }
           

            Console.WriteLine("Enter a number : ");
            int num= Convert.ToInt32(Console.ReadLine());

            int high,mid, low;
            for (int i = 0; i < arr.Length; i++)
            {
                if (arr[i] == num)
                {
                    Console.WriteLine("Number found at index : " + i);
                    break;
                }
            }



        }
    }
}