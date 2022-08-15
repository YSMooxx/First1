//
//  BianLiangVC.swift
//  First1
//
//  Created by New on 2022/8/15.
//

import UIKit

class ChangLiangVC: UIViewController {
    
    override func viewDidLoad() {
        test1()
        test2()
    }
    
    //常量使用关键字 let 来声明，语法如下：
    func test1() {
        
        let constA = 42
        print(constA)
        
        let name = "百度"
        let site = "http://www.baidu.com"
        
        print("\(name)的官网地址为：\(site)-----------test1")
    }
    
    //常量使用关键字 var 来声明，语法如下：
    func test2() {
        
        var constA:Double = 3.1415926
        constA = 3.14159263
        print(constA)
        
        var name = "百度"
        var site = "http://www.baidu.com"
        name = "其他"
        site = "http://www.qita.com"
        
        
        print("\(name)的官网地址为：\(site)-----------test1")
    }
    
}
