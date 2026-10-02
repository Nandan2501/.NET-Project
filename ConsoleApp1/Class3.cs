using System;

namespace ConsoleApplication1

{

    class sum

    {

        static void f(string[] args)

        {

            int sum = 0;
            int[] arr = new int[5];
            for (int i = 0; i < 5; i++)

            {


                Console.Write("Enter Element {0}: ", i);
                string str = Console.ReadLine();
                arr[i] = Convert.ToInt32(str);


            }

            for (int i = 0; i < 5; i++)

            {

                sum = sum + arr[i];

            }

            Console.WriteLine("Sum of Elements : {0}", sum);



            Console.Read();

        }



    }

}