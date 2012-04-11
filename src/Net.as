package
{
    import org.flixel.*;

    public class Net extends FlxSprite
    {
        public function Net(x:Number, y:Number)
        {
            super(x, y);
            makeGraphic(5, 30, 0xff000000);
            immovable = true;
        }
    }
}
