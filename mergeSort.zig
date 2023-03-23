fn merge_sort(comptime T: type, slice: []T) []T {
    if (slice.len <= 1) return slice;

    const mid = slice.len / 2;
    const left = merge_sort(T, slice[0..mid]);
    const right = merge_sort(T, slice[mid..]);

    var result: [slice.len]T = undefined;
    var i: usize = 0;
    var j: usize = 0;
    var k: usize = 0;

    while (i < left.len and j < right.len) : (k += 1) {
        if (left[i] <= right[j]) {
            result[k] = left[i];
            i += 1;
        } else {
            result[k] = right[j];
            j += 1;
        }
    }

    while (i < left.len) : (k += 1, i += 1) {
        result[k] = left[i];
    }

    while (j < right.len) : (k += 1, j += 1) {
        result[k] = right[j];
    }

    return result[0..k];
}

pub fn main() anyerror!void {
    var arr: [10]i32 = [1, 5, 3, 7, 8, 2, 9, 4, 6, 0];
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Unsorted array: {}\n", .{arr});
    arr = merge_sort(i32, arr[0..]);
    try stdout.print("Sorted array: {}\n", .{arr});
}
