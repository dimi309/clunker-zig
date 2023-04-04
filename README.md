Clunker - Zig
=============

Like [clunker](https://github.com/dimi309/clunker), but in Zig. This 
edition however, only works on Windows and it only initialises glfw 
and then creates a Vulkan instance. I have not developed it as much as
[clunker](https://github.com/dimi309/clunker) in Rust, which draws
a box and also runs on Linux and MacOS.
I just wanted to see what it would be like launching the 
[vulkan_helper](https://github.com/dimi309/vulkan_helper) from Zig.

To build this project, you need the Vulkan SDK and mingw set up, and also 
the zig command needs to be in your path. Then you run from within 
the repository:

	prepare-c-libs.bat
	zig build
	
And then you can execute `clunker-zig.exe` from within `zig-out/bin`.
It does not do much, but it successfully gets the needed Vulkan extensions
from glfw and then creates a Vulkan instance.
