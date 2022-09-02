//
//  ShuXingVC.swift
//  First1
//
//  Created by New on 2022/9/2.
//

import UIKit

class ShuXingVC:UIViewController {
    
    override func viewDidLoad() {
        
        test3()
    }
    
    //存储属性1
    func test1() {
        
        var n = Number(digits: 12345)
        n.digits = 67

        print("\(n.digits)")
        print("\(n.pi)")
    }
    
    //存储属性2
    func test2() {
        
        var n = Number(digits: 12345)
        n.digits = 67

        print("\(n.digits)")
        print("\(n.pi)")
        n.pi = 8.7
        print("\(n.pi)")
    }
    
    //延迟存储属性
    func test3() {
        
        let firstsample = sample()
        print(firstsample.no)
        print(firstsample.no.name)
    }
}
