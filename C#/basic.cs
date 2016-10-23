using System;
using System.Collections.Generic;
//using System.Linq;
//using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication2
{
    class Program
    {
        static void Main(string[] args)
        {
            int i = 15;
            float f = 15.55F;
            double d = 15.51312;
            //string s = i.ToString();
            string cd = "Alex";
            string surname = " Tzi";
            string wholename = cd + "" + surname;
            string wholename1 = String.Concat(cd, surname);
            int age = 88;
            Console.WriteLine("My name is " + cd + " and my age is " + age + ".");
            string message = String.Format("My name is {0} and my age is {1}.", wholename1, age);
            Console.WriteLine(message);

            string test = "my test";
            Console.WriteLine(test.Contains("my"));
            Console.WriteLine(test.EndsWith("my"));
            Console.WriteLine(test.ToUpper());
            Console.WriteLine(test.Substring(2, 2));
            Console.WriteLine(test.Length);
            string[] results = test.Split(' ');
            Console.WriteLine(results[0]);

            int[] ages = new int[10];
            //access
            ages[0] = 15;
            ages[1] = 16;

            for (int index=0; index < ages.Length; index+=2)
            {

                ages[index] = index * 2;
            }

            foreach (int ag in ages) {
                Console.Write(ag + " ");
            
            }
            Console.WriteLine();

            List <int> scores = new List<int>();
            scores.Add(25);
            scores.Add(21);
            scores.RemoveAt(0);
            Console.WriteLine(scores.Contains(21));
         
            Console.ReadKey();
        }
    }
}
