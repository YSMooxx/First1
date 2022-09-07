//
//  ZiFuVC.swift
//  First1
//
//  Created by New on 2022/8/23.
//

import UIKit

class ZiFuVC:UIViewController {
    
    override func viewDidLoad() {
        
        test3()
    }
    
    //字符
    func test1() {
        
        let char1: Character = "A"
        let char2: Character = "B"

        print("char1 的值为 \(char1)")
        print("char2 的值为 \(char2)")
    }
    
    //遍历字符串字符
    func test2() {
        
        let string:String = "www.baidu.com"
        
        for ch in string {
            print(ch)
        }
    }
    
    //字符串连接字符
    func test3() {
        
        var varA:String = "Hello "
        let varB:Character = "G"

        varA.append( varB )

        print("varC  =  \(varA)")
    }
}
