package odd.tools.macros;

import haxe.Resource;
import haxe.Template;
import haxe.macro.Compiler;
import haxe.macro.Expr;

import sys.FileSystem;
import sys.io.File;
import sys.io.FileOutput;

import odd.tools.macros.Utils;

class Target
{
    public static macro function init() : Expr
    {
        if (Compiler.getDefine("display"))
        {
            return null;
        }

        Sys.println("Setting up Odd HTML5 project.");

        createIndexFile(Utils.getOutputPath(), Utils.getOutputFileName());

        Sys.println("Done.");

        return null;
    }
    
    private static function createIndexFile(buildDirectory : String, buildName : String) : Void
    {
        Sys.println("Creating index.html.");

        if (buildDirectory == null || buildName == null)
        {
            Sys.println("...No build directory or file name set.");
            Sys.println("...Aborting.");
            return;
        }

        if (FileSystem.exists(buildDirectory + "index.html"))
        {
            Sys.println("...Found existing index.html.");
            Sys.println("...Aborting.");
            return;
        }

        var fOut : FileOutput = File.write(buildDirectory + "index.html", false);
        
        var template : Template = new Template(Resource.getString("index"));
        var templateOutput : String = template.execute({ fileName : buildName });
        
        fOut.writeString(templateOutput);
        fOut.close();

        Sys.println("...Done");
    }
}