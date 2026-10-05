
using System;

class Program
{
    public static void Main()
    {
        Console.WriteLine("jadeja yashrajsinh 24SOECE11012 ");
        int[,] A =
    {
            {1,2,3},
            {4,5,6},
            {7,8,9}
        };
        int[,] B =
        {
            {1,2,3},
            {4,5,6},
            {7,8,9}
        };
        int[,] C = new int[A.GetLength(0), A.GetLength(1)];
        for (int i = 0; i < A.GetLength(0); i++)
        {
            for (int j = 0; j < A.GetLength(1); j++)
            {
                int x = A[i, j] + B[i, j];
                C[i, j] = x;
            }
        }
        Console.WriteLine("array A :");
        for (int i = 0; i < A.GetLength(0); i++)
        {
            for (int j = 0; j < A.GetLength(1); j++)
            {
                Console.Write(A[i, j] + " ");
            }
            Console.WriteLine();
        }
        Console.WriteLine("array B :");
        for (int i = 0; i < A.GetLength(0); i++)
        {
            for (int j = 0; j < A.GetLength(1); j++)
            {
                Console.Write(B[i, j] + " ");
            }
            Console.WriteLine();
        }
        Console.WriteLine("array new :");
        for (int i = 0; i < A.GetLength(0); i++)
        {
            for (int j = 0; j < A.GetLength(1); j++)
            {
                Console.Write(C[i, j] + " ");
            }
            Console.WriteLine();
        }
        Console.ReadLine();

    }
}




