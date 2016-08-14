package odd.macros;

import haxe.Resource;
import haxe.Template;
import haxe.macro.Compiler;
import haxe.macro.Expr;
import sys.FileSystem;
import sys.io.File;
import sys.io.FileOutput;

class HTML5SetupMacro
{
    public static macro function setup() : Expr
    {
        Sys.println("- Setting up Odd HTML5 project");
        
        var outPath : String = FileSystem.fullPath(Compiler.getOutput());
        var output : CompilerOutput = getCompilerOutput(outPath);
        
        Sys.println("- Creating index.html");
        createIndexFile(output);
        
        Sys.println("- Done");

        return null;
    }
    
    private static function createIndexFile(output : CompilerOutput) : Void
    {
        if (!FileSystem.exists(output.filePath + "index.html"))
        {
            Sys.println("index.html does not exist");
            Sys.println("Creating index.html");
            
            var fOut : FileOutput = File.write(output.filePath + "index.html", false);
            
            var template : Template = new Template(Resource.getString("index"));
            var templateOutput : String = template.execute(output);
            
            fOut.writeString(templateOutput);
            fOut.close();
        }
        else
        {
            Sys.println("Found existing index.html");
        }
    }
    
    private static function getCompilerOutput(pathToFile : String) : CompilerOutput
    {
        var filePath : String = "";
        var fileName : String = "";
        
        var i = pathToFile.length - 1;
        while (i > 0)
        {
            if (pathToFile.charAt(i) == "\\" || pathToFile.charAt(i) == "/")
            {
                filePath = pathToFile.substr(0, i + 1);
                fileName = pathToFile.substring(i + 1, pathToFile.length);
                break;
            }
            i--;
        }
        
        return { filePath : filePath, fileName : fileName };
    }
}

private typedef CompilerOutput = {
    filePath : String,
    fileName : String
}