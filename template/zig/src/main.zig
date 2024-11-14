const std = @import("std");

fn greet() []const u8 {
    return "Hello, World!";
}

pub fn main() !void {
    std.debug.print("{s}\n", .{greet()});
}

test "greet" {
    try std.testing.expectEqualStrings("Hello, World!", greet());
}
