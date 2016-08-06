package odd._target;

import js.Browser;
import js.html.CanvasRenderingContext2D;
import js.html.ImageData;

class Html5Context
{
    private var framebuffer : Framebuffer;
    
    private var context2d : CanvasRenderingContext2D;
    private var imageData : ImageData;
    
    public function new(width : Int, height : Int)
    {
        trace("-- odd-target-html5 --");
        
        var document = Browser.document;
        var canvas = document.createCanvasElement();
        context2d = canvas.getContext2d();
        canvas.setAttribute("width", Std.string(width));
        canvas.setAttribute("height", Std.string(height));
        document.body.appendChild(canvas);
        
        imageData = context2d.getImageData(0, 0, width, height);
        framebuffer = new Framebuffer(width, height, imageData.data);
    }
    
    public function run(onUpdate : Void->Void, onDraw : Framebuffer->Void) : Void
    {
        function loop(t : Float) {
            if (onUpdate != null) onUpdate();
            
            if (onDraw != null) onDraw(framebuffer);
            
            draw();
            
            Browser.window.requestAnimationFrame(loop);
        }
        
        loop(0);
    }
    
    private function draw() : Void
    {
        context2d.clearRect(0, 0, framebuffer.width, framebuffer.height);
        context2d.putImageData(imageData, 0, 0);
    }
}