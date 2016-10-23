using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ex2
{
    class Program
    {
        public enum Size
        {
            Small = 100,
            Normal = 150,
            Double = 300
        } 

        public class Coffee
        {

            public Size size;
            public Coffee (Size a)
            {
                this.size = a;
            }
        }
        public class Order
        {
            public static double CalculateTotalCost(Coffee[] coffees)
            {
                if (coffees == null || coffees.Length == 0)
                    return 0;

                double TotalCost = 0;

                foreach(Coffee C in coffees)
                {
                    if (C.size == Size.Small)
                        TotalCost += 0.5;

                    if(C.size == Size.Normal)
                        TotalCost += 1.0;

                    if (C.size == Size.Double)
                        TotalCost += 2.5;
                }

                return TotalCost;

            }
        }

        static void Main(string[] args)
        {
            Coffee[] cof = new Coffee[]
            {
                new Coffee((Size)150),
                new Coffee((Size)100),
                new Coffee((Size)300)
            };

            double TotalCost = Order.CalculateTotalCost(cof);

            Console.WriteLine($"The total coffee cost is {TotalCost}.");
            

            Console.ReadKey();
        }
    }
}
