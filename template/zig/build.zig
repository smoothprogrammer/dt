const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const run_step = b.step("run", "Run the application");
    {
        const exe = b.addExecutable(.{
            .name = "zigproject",
            .root_module = b.createModule(.{
                .root_source_file = b.path("src/main.zig"),
                .target = target,
                .optimize = optimize,
            }),
        });
        run_step.dependOn(&b.addRunArtifact(exe).step);
    }

    const test_step = b.step("test", "Run unit tests");
    {
        const unit_test = b.addTest(.{
            .root_module = b.createModule(.{
                .root_source_file = b.path("src/main.zig"),
                .target = target,
                .optimize = optimize,
            }),
        });
        test_step.dependOn(&b.addRunArtifact(unit_test).step);
    }
}
