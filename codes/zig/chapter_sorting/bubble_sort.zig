// File: bubble_sort.zig
// Created Time: 2023-01-08
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 冒泡排序
fn bubbleSort(nums: []i32) void {
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // 内循环：冒泡操作
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

// 冒泡排序（标志优化）
fn bubbleSortWithFlag(nums: []i32) void {
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var flag = false;   // 初始化标志位
        var j: usize = 0;
        // 内循环：冒泡操作
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true;
            }
        }
        if (!flag) break;   // 此轮冒泡未交换任何元素，直接跳出
    }
}

// Driver Code
pub fn main() !void {
    var nums = [_]i32{ 4, 1, 3, 1, 5, 2 };
    bubbleSort(&nums);
    std.debug.print("冒泡排序完成后 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    var nums1 = [_]i32{ 4, 1, 3, 1, 5, 2 };
    bubbleSortWithFlag(&nums1);
    std.debug.print("\n冒泡排序完成后 nums1 = ", .{});
    inc.PrintUtil.printArray(i32, &nums1);
    
    const getchar = try std.io.getStdIn().reader().readByte();
    _ = getchar;
}

