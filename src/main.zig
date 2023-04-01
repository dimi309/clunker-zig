const std = @import("std");

const c = @cImport({
    @cInclude("vulkan_helper.h");
});

pub fn main() !void {
    // But now in order to start we need something like glfw... There does not seem to exist
    // something like winit for Rust for example...
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
