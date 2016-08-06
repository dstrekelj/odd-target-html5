package odd;

import odd._target.Html5Context;

/**
 * HTML5 canvas context.
 */
class Context 
{
    public static var width(default, null) : Int;
    public static var height(default, null) : Int;
    
    private static var context : Html5Context;
    
    public static function init(_width : Int, _height : Int) : Void
    {
        trace("-- odd.target.html5 --");
        
        if (context == null)
        {
            width = _width;
            height = _height;
            context = new Html5Context(width, height);
        }
    }
    
    public static function run(onUpdate : Void->Void, onDraw : Framebuffer->Void) : Void
    {
        if (context != null)
        {
            context.run(onUpdate, onDraw);
        }
    }
}