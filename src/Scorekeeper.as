package 
{
    import org.flixel.*;
    public class Scorekeeper
    {
        private var leftScore : Number;
        private var rightScore : Number;

        private var scores : Vector.<int>;

        public static var LEFT : Number = 0;
        public static var RIGHT : Number = 1;

        public function Scorekeeper()
        {
            scores = new Vector.<int>();
            scores.push(0);
            scores.push(0);
        }

        public function score(side:Number, delta:int):void
        {
            scores[side] += delta;
            FlxG.log("Score 0: " + scores[LEFT] + " Score 1: " + scores[RIGHT]);
        }
    }
}
