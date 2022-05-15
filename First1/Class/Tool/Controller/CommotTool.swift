//
//  CommotTool.swift
//  First1
//
//  Created by New on 2022/5/15.
//

import Foundation

let say:(String) -> Void = {
    (name: String) -> Void in
    print("hello \(name)")
}

let say2:(String) -> Void = {
    (name: String) -> Void in
    print("hi \(name)")
}

let say3:() ->Void = {
    print("hello xiaohange")
}

func showArray(array:[Int]) {
    for num in array {
        print("\(num)")
    }
}

let cmp = {
    (a: Int, b:Int) ->Int in
    if a > b{
        return 1
    }else if a < b
    {
        return -1
    }else
    {
        return 0
    }
}

func bubbleSort(array : inout [Int], cmp: (Int, Int) -> Int){
    for _ in 0..<array.count {
        for j in 0..<(array.count - 1) {
            if array[j] > array[j + 1] {
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
}

func bubbleSort1(array : inout [Int], cmp: (Int, Int) -> Int){
    for _ in 0..<array.count {
        for j in 0..<(array.count - 1) {
            if array[j] < array[j + 1] {
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
}



