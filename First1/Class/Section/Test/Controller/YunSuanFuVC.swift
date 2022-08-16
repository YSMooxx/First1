//
//  YunSuanFuVC.swift
//  First1
//
//  Created by New on 2022/8/15.
//

import UIKit

class YunSuanFuVC:UIViewController {
    
    override func viewDidLoad() {
        
        test4()
    }
    
    //算数符
    func test1() {
        
        var A = 10
        var B = 20

        print("A + B 结果为：\(A + B)")
        print("A - B 结果为：\(A - B)")
        print("A * B 结果为：\(A * B)")
        print("B / A 结果为：\(B / A)")
        A += 1   // 类似 A++
        print("A += 1 后 A 的值为：\(A)")
        B -= 1   // 类似 B--
        print("B -= 1 后 B 的值为：\(B)")
    }
    
    //比较运算符
    func test2() {
        
        let A = 10
        let B = 20

        print("A == B 结果为：\(A == B)")
        print("A != B 结果为：\(A != B)")
        print("A > B 结果为：\(A > B)")
        print("A < B 结果为：\(A < B)")
        print("A >= B 结果为：\(A >= B)")
        print("A <= B 结果为：\(A <= B)")

    }
    
    //位运算符
    func test3() {
        
        let A = 60  // 二进制为 0011 1100
        let B = 13 // 二进制为 0000 1101

        print("A&B 结果为：\(A&B)")
        print("A|B 结果为：\(A|B)")
        print("A^B 结果为：\(A^B)")
        print("~A 结果为：\(~A)")
    }
    
    //逻辑运算符
    func test4() {
        
        let A = true
        let B = false

        print("A && B 结果为：\(A && B)")
        print("A || B 结果为：\(A || B)")
        print("!A 结果为：\(!A)")
        print("!B 结果为：\(!B)")
    }
}
