//
//  HanShuVC.swift
//  First1
//
//  Created by New on 2022/8/24.
//

import UIKit

class HanShuVC:UIViewController {
    
    override func viewDidLoad() {
        /*
        print(runoob(site: "djy-es"))
        print(runoob(name: "菜鸟教程：", site: "www.runoob.com"))
        print(runoob(name: "Google：", site: "www.google.com"))
        test1(name: "七七", other: 123)
        print(minMax(array: [8, -6, 2, 109, 3, 71]))
         print(ShuXuArray1(array: [1,-2,-6,7,9,3]))
         print(YiXuArray1(array: [1,-2,-6,7,9,3,3]))
        */
        
        print(calcDecrement(forDecrement: 30)())
    }
    
    //函数调用
    func runoob(site: String) -> String {
        
        return ("www."+site+".com")
    }
    
    //函数参数
    func runoob(name: String, site: String) -> String {
        
        return name + site
    }
    
    func test1(name:String, other: Int)  {
        
        print("姓名：\(name)")
        let cc = other+2
        print("身高：\(cc)cm")
    }
    
    //元组作为函数返回值
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    
    //数组作为函数返回值
    func ShuXuArray1(array: [Int]) -> ([Int]) {
        
        return ShuXuArray(nums: array)
    }
    
    func YiXuArray1(array: [Int]) -> ([Int]) {
        
        return NiXuArray(nums: array)
    }
    
    //函数嵌套
    func calcDecrement(forDecrement total: Int) -> () -> Int {
       var overallDecrement = 0
       func decrementer() -> Int {
          overallDecrement -= total
          return overallDecrement
       }
       return decrementer
    }
    
}
