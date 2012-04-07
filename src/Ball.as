package
{
    import org.flixel.*;

    public class Ball extends FlxSprite
    {
        public function Ball(x:Number = 0, y:Number = 0)
        {
            super(x, y);
            makeGraphic(10, 12, 0xffaa1111); 
            maxVelocity.x = 300;
            maxVelocity.y = 300;
            acceleration.y = 200;
            drag.x = 100;
        }

    }
}
