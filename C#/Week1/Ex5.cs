using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise_05
{
    class Program
    {
        public abstract class Animal
        {
            public int Age { get; protected set; }
            public string Name;
            
            protected string sound;
            public enum Gender
            {
                Male =100,
                Female=200
            }
            public Gender gender;
            public Animal(string name, int age, Gender Gender)
            {
                Name = name;
                Age = age;
                gender = Gender;
            }

            public string MakeSound()
            {
                return sound;
            }
        }

        public class Dog : Animal
        {
            public Dog(string name, int age, Gender gender) : base(name, age, gender)
            {
                sound = "wuf wuf";
            }
        }

        public class Cat : Animal
        {
            public Cat(string name, int age, Gender gender) : base(name, age, gender)
            {
                sound = "meow!";
            }
            
        }

        static void Main(string[] args)
        {
            Animal[] animals = new Animal[]
            {
                new Dog("Lucy", 5, Animal.Gender.Female),
                new Dog("Tom", 1, Animal.Gender.Male),
                new Cat("Neda", 4, (Animal.Gender)200)
            };
            for (int i = 0; i < animals.Length; i++)
            {
                Console.WriteLine(animals[i].Name + "who is " + animals[i].gender + " says \"" + animals[i].MakeSound() + "\"");
            }

            Console.ReadKey();
        }
    }
}
