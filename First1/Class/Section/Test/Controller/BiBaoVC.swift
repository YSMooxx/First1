//
//  BiBaoVC.swift
//  First1
//
//  Created by New on 2022/8/26.
//

import UIKit

class BiBaoVC:UIViewController {
    
    override func viewDidLoad() {
    
        test2()
    }
    
    //语法
    func test1() {
        
        let divide1 = {(val1: Int, val2: Int) -> Int in
           return val1 / val2
        }
        
        let result = divide1(200, 20)
        print (result)
    }
    
    //闭包表达式
    func test2() {
        
        let names = ["AT", "AE", "D", "S", "BE"]

        // 使用普通函数(或内嵌函数)提供排序功能,闭包函数类型需为(String, String) -> Bool。
        func backwards(s1: String, s2: String) -> Bool {
            return s1 > s2
        }
        let reversed = names.sorted(by: backwards)

        print(reversed)
    }
}
