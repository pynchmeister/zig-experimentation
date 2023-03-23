fn fibonacci(n: u64) u64 {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

pub fn main() void {
    const num = 10;
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Fibonacci sequence up to {}:\n", .{num});
    for (var i: u64 = 0; i < num; i += 1) {
        try stdout.print("{} ", .{fibonacci(i)});
    }
    try stdout.print("\n");
}
