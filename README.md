# odd-target-html5

HTML5 canvas target for the [Odd software renderer](https://github.com/dstrekelj/odd) project.

Provides an implementation of the target-specific rendering context and framebuffer.

## Installation

To install both the Odd dependency and this target, run the following commands from your command line:

```
haxelib git odd https://github.com/dstrekelj/odd.git
haxelib git odd-target-html5 https://github.com/dstrekelj/odd-target-html5.git
```

If you don't have git, do the following:

```
haxelib dev odd path/to/downloaded/odd/repository
haxelib dev odd-target-html5 path/to/downloaded/odd-target-html5/repository
```

## Usage

Include the following flags in your project's .hxml file:

```
-lib odd
-lib odd-target-html5

-js out/html5/main.js
```
