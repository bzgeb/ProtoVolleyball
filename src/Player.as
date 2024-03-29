package
{
    import org.flixel.*;
    import KickHandler;

    public class Player extends FlxSprite
    {
        private var leftKey : String;
        private var rightKey : String;
        private var jumpKey : String;

        private var rotateKey : String;
        private var reverseRotateKey : String;

        private var kickKey : String;

        public var thigh : FlxSprite;
        public var leg : FlxSprite;
        public var foot: FlxSprite;

        public var footBallCollision : Boolean;
        private var legAngle : Number;

        public var kickHandler : KickHandler;

        private var spriteCenter : FlxPoint;

        public function Player(state:FlxState, x:Number = 0, y:Number = 0)
        {
            super(x, y);
            makeGraphic(5, 30, 0xff000000); 
            maxVelocity.x = 80;
            maxVelocity.y = 200;
            acceleration.y = 200;
            drag.x = maxVelocity.x * 4;
            setKeys();

            leg = new FlxSprite(x, y);
            leg.makeGraphic(2, 2, 0xff000000);
            legAngle = 270;

            foot = new FlxSprite(x, y);
            foot.makeGraphic(2, 2, 0xff000000);
 
            thigh = new FlxSprite(x, y);
            thigh.makeGraphic(2, 2, 0xff000000);

            state.add(leg);
            state.add(foot);
            state.add(thigh);

            spriteCenter = new FlxPoint();
        }

        override public function update():void
        {
            acceleration.x = 0;
            if (FlxG.keys.pressed(leftKey) && isTouching(FlxObject.FLOOR)) {
                acceleration.x = -maxVelocity.x * 4;
            }
            if (FlxG.keys.pressed(rightKey) && isTouching(FlxObject.FLOOR)) {
                acceleration.x = maxVelocity.x * 4;
            }

            if (FlxG.keys.pressed(jumpKey) && isTouching(FlxObject.FLOOR)) {
                velocity.y = -maxVelocity.y / 2;
            }

            if (FlxG.keys.pressed(rotateKey)) {
                legAngle += 3;
            }

            if (FlxG.keys.pressed(reverseRotateKey)) {
                legAngle -= 3;
            }
//            legAngle = FlxU.bound(legAngle, 90, 270);
            spriteCenter.x = (x + width / 2);
            spriteCenter.y = (y + height / 2);

            var rLegAngle : Number;
            rLegAngle = legAngle * (Math.PI / 180);
            leg.x = 10 * Math.cos(rLegAngle) + spriteCenter.x;
            leg.y = 10 * Math.sin(rLegAngle) + spriteCenter.y;

            thigh.x = 5 * Math.cos(rLegAngle) + spriteCenter.x;
            thigh.y = 5 * Math.sin(rLegAngle) + spriteCenter.y;

            foot.x = 15 * Math.cos(rLegAngle) + spriteCenter.x;
            foot.y = 15 * Math.sin(rLegAngle) + spriteCenter.y;

            if (kickHandler != null) {
                var legGroup : FlxGroup = new FlxGroup();

                legGroup.add(leg);
                legGroup.add(thigh);
                legGroup.add(foot);

                if (FlxG.keys.justPressed(kickKey)) {
                    if(kickHandler.check(legGroup)) {
                        kickHandler.kick(legAngle, 5);
                        leg.color = 0xff000000;        
                    }
                }
            }

            super.update();
        }

        public function setKeys(left:String = "LEFT", right:String = "RIGHT", jump:String = "UP", rotate:String = "N", reverseRotate:String = "M", kick:String = "DOWN"):void
        {
           leftKey = left;
           rightKey = right;
           jumpKey = jump;
           kickKey = kick;
           rotateKey = rotate;
           reverseRotateKey = reverseRotate;
        }
    }
}
