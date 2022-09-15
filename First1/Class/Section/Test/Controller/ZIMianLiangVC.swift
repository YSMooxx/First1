//
//  ZIMianLiangVC.swift
//  First1
//
//  Created by New on 2022/8/15.
//

import UIKit

class ZIMianLiangVC:UIViewController {
    
    override func viewDidLoad() {
        
//        test1()
//        test2()
//        test3()
//        test4()
//        test5()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        read()
        read1()
    }
    
    func read1() {
        
        print("name的值:\(UserDef.userDef.name!)")
        print("num的值:\(UserDef.userDef.num!)")
        print("wRatio的值:\(UserDef.userDef.wRatio)")
        print("hRatio的值:\(UserDef.userDef.hRatio)")
        print("RScreenH的值:\(RScreenH)")
        print("RScreenW的值:\(RScreenW)")
    }
    
    func read() {
        
    
    }
    
    //Swift 字面量
    func test1() {
        
        let aNumber = 3         //整型字面量
        let aString = "Hello"   //字符串字面量
        let aBool = true        //布尔值字面量
        
        print(aNumber,aString,aBool)
    }
    
    //整型字面量
    
    func test2() {
        
        let decimalInteger = 17           // 17 - 十进制表示
        let binaryInteger = 0b10001       // 17 - 二进制表示
        let octalInteger = 0o21           // 17 - 八进制表示
        let hexadecimalInteger = 0x11     // 17 - 十六进制表示
        
        print(decimalInteger,binaryInteger,octalInteger,hexadecimalInteger)
    }
    
    //浮点型字面量
    func test3() {
        
        let decimalDouble = 12.1875       //十进制浮点型字面量
        let exponentDouble = 1.21875e1    //十进制浮点型字面量
        let hexadecimalDouble = 0xC.3p0   //十六进制浮点型字面量
        
        print(decimalDouble,exponentDouble,hexadecimalDouble)
    }
    
    //字符串型字面量
    func test4() {
        
        print("1\01")
        print("1\\1")
        print("1\n1")
    }
    //字符串型字面量2
    func test5() {
        
        let stringL = "Hello\tWorld\n\nwww其他：\'http://www.qita.com\'"
        print(stringL)
    }
    
    //布尔型字面量
    
    func test6() {
        /*
        布尔型字面量的默认类型是 Bool。

        布尔值字面量有三个值，它们是 Swift 的保留关键字：

        true 表示真。

        false 表示假。

        nil 表示没有值。*/
    }
    
}
