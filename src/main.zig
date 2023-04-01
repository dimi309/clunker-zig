const std = @import("std");

const c = @cImport({
    @cInclude("vulkan_helper.h");
    @cInclude("GLFW/glfw3.h");
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
