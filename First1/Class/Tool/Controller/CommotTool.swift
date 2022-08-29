//
//  CommotTool.swift
//  First1
//
//  Created by New on 2022/5/15.
//

import Foundation

//顺序排列
func ShuXuArray(nums: [Int]) -> ([Int]) {
    var a = nums
    let n = a.count
    for i in 0..<n {
        for j in 0..<(n - 1 - i) {
            if a[j] > a[j + 1] {
                a.swapAt(j, j + 1)
            }
        }
    }
    
    return a
}

//逆序排列
func NiXuArray(nums: [Int]) -> ([Int]) {
    var a = nums
    let n = a.count
    for i in 0..<n {
        for j in 0..<(n - 1 - i) {
            if a[j] < a[j + 1] {
                a.swapAt(j, j + 1)
            }
        }
    }
    
    return a
}

//除法闭包
let divide = {(val1: Int, val2: Int) -> Int in
   return val1 / val2
}





