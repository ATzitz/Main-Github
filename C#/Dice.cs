using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD
{
    class Program
    {
        public class Game
        {
            public void Play()
            {
                // TO DO: info of the game 
            }
        }
        public class Dice
        {
            public int sides;
            static public int rolls ;
            public Dice()
            {
                sides = 20;
            }
            public Dice(int sides)
            {
                this.sides = sides;
            }
            public void Roll()
            {
                rolls += 1;
            }
            //public int GetRolls()
            //{
            //    return Dice.rolls;
            //}
        }
        public class Player
        {
            public int roll;
            public int score; 
            static Random rand = new Random();
            public string name { get; private set; }
            public string surname { get; private set; }
            public Player(string x)
            {
                name = x;
                surname = "";
                score = 0;
            }
            public Player(string x, string y)
            {
                name = x;
                surname = y;
                score = 0;
            }
            public int Roll(Dice dice)
            {
                int result = rand.Next(1, dice.sides + 1);
                Dice.rolls += 1;
                return result;
            }

        }
        static void Main(string[] args)
        {
            Dice d4 = new Dice(4);
            Dice d8 = new Dice(8);
            Dice d12 = new Dice(12);
            Dice d20 = new Dice(20);



            Player Player1 = new Player("Nikos");
            Player Player2 = new Player("Kostas");
            Console.WriteLine(Player1.name);
            Player1.Roll(d20);

            int round = 0;
            int result;
            while (round < 100)
            {
                int result1 = Player1.Roll(d20);
                int result2 = Player2.Roll(d20);
                int diff = result1 - result2;
                if (diff < 0)
                {
                    Player2.score += Math.Abs(diff);
                }
                if (diff > 0)
                {
                    Player1.score += Math.Abs(diff);
                }
                round += 1;
                //{
                //    if (round % 2 == 0)
                //    {
                //        result = Player1.Roll(d20);
                //        Console.WriteLine(String.Format("{0} rolled {1}", Player1.name, result));
                //    }
                //    else
                //    {
                //        result = Player2.Roll(d20);
                //        Console.WriteLine(String.Format("{0} rolled {1}", Player2.name, result));
                //    }
                  

                //}
                
                
            }
            Console.WriteLine("Total Rolls: " + Dice.rolls);
            Console.ReadKey();
        }
    }
}
