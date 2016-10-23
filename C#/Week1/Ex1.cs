using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ex1
{
    class Program
    {
        public class complex
        {
            double r;
            double i;
            // complex number
            public complex( double r, double i)
            {
                double real = r;
                double img = i;
            }
            // by default 0.0
            public complex()
            {
                r=0;
                i = 0;
            }
            //real number
            public complex(double real)
            {
                r = real;
                i = 0;
            }
            public complex Add(complex z)
            {
                complex sum = new complex(this.r + z.r, this.i + z.i); 
                return sum;
            }
            //public complex Add(int z)     OVERLOADING add ( argument with int also availabe with complex)
            //{
            //    complex sum = new complex(this.r + z.r, this.i + z.i);
            //    return sum;
            //}
            public static complex Add(complex x, complex z)
            {
                return new complex(x.r + z.r, x.i + z.i);
            }
            public static complex operator + (complex x, complex z)
            {
                return new complex(x.r + z.r, x.i + z.i);
            }
            public override string ToString()
            {
                return $"({this.r},{this.i})";
            }
        }
        
        static void Main(string[] args)
        {
            complex complex1 = new complex(1, 2);
            complex complex2 = new complex(3, 4);
            complex a = complex1.Add(complex2);
            complex b = complex.Add(complex1,complex2);
            complex c = complex1 + complex2;
            Console.WriteLine(c);
            Console.ReadKey();
        }
    }
}
