const std = @import("std");

pub fn build(b: *std.build.Builder) !void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    
    const optimize = b.standardOptimizeOption(.{});

     const exe = b.addExecutable(.{
        .name = "clunker-zig",
        // In this case the main source file is merely a path, however, in more
        // complicated build scripts, this could be a generated file.
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    
    exe.linkLibC();
    exe.addIncludePath("include");

    exe.addLibraryPath("lib");
    exe.linkSystemLibrary("vulkan_helper");
    exe.linkSystemLibrary("glfw3");
    exe.linkSystemLibrary("gdi32");
    const W = std.unicode.utf8ToUtf16LeStringLiteral;

    if (std.os.getenvW(W("VULKAN_SDK"))) |vsdk| {
        const alloc = std.heap.page_allocator;
        const v = try std.unicode.utf16leToUtf8Alloc(alloc, vsdk);
        defer alloc.free(v);
        const vlib = try std.fmt.allocPrint(alloc, "{s}/Lib", .{v});
        exe.addLibraryPath(vlib);
        exe.linkSystemLibrary("vulkan-1");
    }

    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

     const exe_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&exe_tests.step);
}
