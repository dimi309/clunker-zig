const std = @import("std");

// Translated from vulkan_helper.h with
// zig translate-c -DVULKAN_HELPER_NO_NATIVE=1 -I%VULKAN_SDK%\Include vulkan_helper.h > vulkan_helper.zig
const vh = @import("vulkan_helper.zig");

const c = @cImport({
    @cInclude("GLFW/glfw3.h"); 
});

pub fn main() !void {
    if (c.glfwInit() != c.GLFW_TRUE) return error.GlfwInitFailed;
    defer c.glfwTerminate();
    std.debug.print("GLFW initialisation has succeeded.\n", .{});
    
}

