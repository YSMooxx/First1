//
//  ZiFuChuanVC.swift
//  First1
//
//  Created by New on 2022/8/22.
//

import UIKit

class ZiFuChuanVC:UIViewController {
    
    override func viewDidLoad() {
    
        test9()
    }
    
    //创建字符串
    func test1() {
        
        // 使用字符串字面量
        let stringA = "Hello, World!"
        print( stringA )

        // String 实例化
        let stringB = String("Hello, World!")
        print( stringB )
    }
    
    //空字符串

    func test2() {
        
        // 使用字符串字面量创建空字符串
        let stringA = ""

        if stringA.isEmpty {
           print( "stringA 是空的" )
        } else {
           print( "stringA 不是空的" )
        }

        // 实例化 String 类来创建空字符串
        let stringB = String()

        if stringB.isEmpty {
           print( "stringB 是空的" )
        } else {
           print( "stringB 不是空的" )
        }
    }
    
    //字符串常量
    func test3() {
        
        var stringA = "菜鸟教程："
        stringA += "http://www.runoob.com"
        print( stringA )
    }
    
    //字符串中插入值
    func test4() {
        
        let varA   = 20
        let constA = 100
        let varC:Float = 20.0

        let stringA = "\(varA) 乘于 \(constA) 等于 \(varC * 100)"
        print( stringA )
    }
    
    //字符串连接
    func test5() {
        
        let constA = "菜鸟教程："
        let constB = "http://www.runoob.com"

        let stringA = constA + constB

        print( stringA )
    }
    
    //字符串长度
    func test6() {
        
        let varA   = "www.runoob.com"

        print( "\(varA), 长度为 \(varA.count)" )

    }
    
    //字符串比较
    func test7() {
        
        let varA   = "Hello, Swift!"
        let varB   = "Hello, Swift!"

        if varA == varB {
           print( "\(varA) 与 \(varB) 是相等的" )
        } else {
           print( "\(varA) 与 \(varB) 是不相等的" )
        }
    }
    
    //Unicode 字符串
    func test8() {
        
        let unicodeString   = "菜鸟教程"

        print("UTF-8 编码: ")
        for code in unicodeString.utf8 {
           print("\(code) ")
        }

        print("\n")

        print("UTF-16 编码: ")
        for code in unicodeString.utf16 {
           print("\(code) ")
        }
    }
    
    //实例
    func test9() {
        
        let str = "菜鸟教程runoob.com"

        print("---- 正序遍历 ----")
        var i = 0
        for ch in str {
            print("\(i): \(ch)")
            i += 1
        }

        print("---- 逆序遍历 ----")
        var j = str.count
        for ch in str.reversed() {
            j -= 1
            print("\(j): \(ch)")
        }

        print("---- 基于索引的正序遍历 ----")
        for i in 0..<str.count {
            let ch: Character = str[str.index(str.startIndex, offsetBy: i)]
            print("\(i): \(ch)")
        }

        print("---- 基于索引的逆序遍历 ----")
        //for i in stride(from: str.count - 1, to: -1, by: -1) {
        for i in stride(from: str.count - 1, through: 0, by: -1) {
            let ch: Character = str[str.index(str.startIndex, offsetBy: i)]
            print("\(i): \(ch)")
        }

        print("---- 基于EnumeratedSequence的遍历 ----")
        for (i, ch) in str.enumerated() {
            print("\(i): \(ch)")
        }
    }
}
