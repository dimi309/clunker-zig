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

    var glfwExtensionCount: u32 = 0;
    var glfwExtensions = c.glfwGetRequiredInstanceExtensions(&glfwExtensionCount);

    var success: c_int = vh.vh_create_instance("Vulkan zig test", glfwExtensions, glfwExtensionCount);
    if (success == 1) {
        std.debug.print("Vulkan Instance created!\n", .{});
    } else {
        std.debug.print("Failed to create vulkan instance.\n", .{});
    }
    defer _ = vh.vh_shutdown();
}
