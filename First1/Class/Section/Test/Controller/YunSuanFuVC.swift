//
//  YunSuanFuVC.swift
//  First1
//
//  Created by New on 2022/8/15.
//

import UIKit

class YunSuanFuVC:UIViewController {
    
    override func viewDidLoad() {
        
        test1()
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
}
