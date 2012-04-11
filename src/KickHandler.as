package {

    import org.flixel.*;
    import Ball;

    public class KickHandler
    {
        private var ball : Ball;
        public function KickHandler(_ball:Ball)
        {
           ball = _ball; 
        }

        public function kick(angle:Number, power:Number):void
        {
            var rAngle : Number = angle * (Math.PI / 180);
            ball.velocity.x = ball.x * Math.cos(rAngle) * power;
            ball.velocity.y = ball.y * Math.sin(rAngle) * power;
        }

        public function check(foot:FlxBasic):Boolean
        {
            return ball.overlaps(foot);
        }
    }
}
