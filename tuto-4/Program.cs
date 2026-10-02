using System;

// User-defined exception class
class MyException : Exception
{
    public MyException(string str)
        : base(str)
    {
        Console.WriteLine("User defined exception");
    }
}

class MyClient
{
    public static void Main()
    {
        Console.WriteLine("Name          : JADEJA YASHRAJSINH");
        Console.WriteLine("Enrollment No : 24SOECE11012");
        Console.WriteLine();

        try
        {
            throw new MyException(
                "my exception generated.");
        }
        catch (Exception e)
        {
            Console.WriteLine(
                "Exception caught here: " + e.Message);
        }

        Console.WriteLine("LAST STATEMENT");

        Console.ReadLine();
    }
}

