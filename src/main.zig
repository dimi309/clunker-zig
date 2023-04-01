const std = @import("std");

const c = @cImport({
    //@cInclude("vulkan_helper.h"); // This fails cImport probably
    // because of the windows.h include, since windows.h  is actually
    // what makes zig translace-c.
    
    @cInclude("GLFW/glfw3.h"); // This produces some linking errors,
    // beyond glfw3.

    // Both abovementioned problems can probably be solved but they
    // show that zig cannot "just work with c libs". It kind of can,
    // but it still takes quite a bit of work.
});

pub fn main() !void {
    if (c.glfwInit() != c.GLFW_TRUE) return error.GlfwInitFailed;
    defer c.glfwTerminate();
    std.debug.print("GLFW initialisation has succeeded.\n", .{});
    
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
