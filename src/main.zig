const std = @import("std");

// Translated from vulkan_helper.h with
// zig translate-c -DVULKAN_HELPER_NO_NATIVE=1 -I%VULKAN_SDK%\Include vulkan_helper.h > vulkan_helper.zig
const vh = @import("vulkan_helper.zig");

const c = @cImport({
    @cInclude("GLFW/glfw3.h"); // This produces some linking errors,
    // beyond glfw3.
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
