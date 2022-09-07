//
//  ZiDianVC.swift
//  First1
//
//  Created by New on 2022/8/24.
//

import UIKit

class ZiDianVC:UIViewController {
    
    override func viewDidLoad() {
    
        test10()
    }
    
    //创建字典
    func test1() {
        
        let someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        
        print(someDict)
    }
    
    //访问字典
    func test2() {
        
        let someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

        let someVar = someDict[1]!

        print( "key = 1 的值为 \(someVar)" )
        print( "key = 2 的值为 \(someDict[2]!)" )
        print( "key = 3 的值为 \(someDict[3]!)" )
    }
    
    //修改字典
    func test3() {
        
        var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

        let oldVal = someDict.updateValue("One 新的值", forKey: 1)

        let someVar = someDict[1]

        print( "key = 1 旧的值 \(oldVal!)" )
        print( "key = 1 的值为 \(someVar!)" )
        print( "key = 2 的值为 \(someDict[2]!)" )
        print( "key = 3 的值为 \(someDict[3]!)" )
    }
    
    //修改字典2
    func test4() {
        
        var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

        let oldVal = someDict[1]
        someDict[1] = "One 新的值"
        let someVar = someDict[1]

        print( "key = 1 旧的值 \(oldVal!)" )
        print( "key = 1 的值为 \(someVar!)" )
        print( "key = 2 的值为 \(someDict[2]!)" )
        print( "key = 3 的值为 \(someDict[3]!)" )
    }
    
    //移除 Key-Value 对
    func test5() {
        
        var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

        someDict.removeValue(forKey: 2)

        print( "key = 1 的值为 \(someDict[1]!)" )
        print( "key = 3 的值为 \(someDict[3]!)" )
        print(someDict)
    }
    
    //移除 Key-Value 对2
    func test6() {
        
        var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

        someDict[2] = nil

        print( "key = 1 的值为 \(someDict[1]!)" )
        print( "key = 3 的值为 \(someDict[3]!)" )
        print(someDict)
    }
    
    //遍历字典
    func test7() {
        
        let someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

        for (key, value) in someDict {
           print("字典 key: \(key) -  字典 value: \(value)")
        }
        
        for (key, value) in someDict.enumerated() {
            print("字典 key \(key) -  字典 (key, value) 对 \(value)")
        }
    }
    
    //字典转换为数组
    func test8() {
        
        let someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

        let dictKeys = [Int](someDict.keys)
        let dictValues = [String](someDict.values)

        print(dictKeys)

        for (key) in dictKeys {
            print("\(key)")
        }

        print(dictValues)

        for (value) in dictValues {
            print("\(value)")
        }
    }
    
    //count 属性
    func test9() {
        
        let someDict1:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        let someDict2:[Int:String] = [4:"Four", 5:"Five"]

        print("someDict1 含有 \(someDict1.count) 个键值对")
        print("someDict2 含有 \(someDict2.count) 个键值对")
    }
    
    //isEmpty 属性
    func test10() {
        
        let someDict1:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        let someDict2:[Int:String] = [4:"Four", 5:"Five"]
        let someDict3:[Int:String] = [Int:String]()

        print("someDict1 = \(someDict1.isEmpty)")
        print("someDict2 = \(someDict2.isEmpty)")
        print("someDict3 = \(someDict3.isEmpty)")
    }
    
    
}
