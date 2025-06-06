const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const run_step = b.step("run", "Run the app");
    {
        const exe = b.addExecutable(.{
            .name = "cproject",
            .root_module = b.createModule(.{
                .target = target,
                .optimize = optimize,
            }),
        });
        exe.addCSourceFile(.{ .file = b.path("main.c") });
        exe.linkLibC();
        run_step.dependOn(&b.addRunArtifact(exe).step);
    }
}
