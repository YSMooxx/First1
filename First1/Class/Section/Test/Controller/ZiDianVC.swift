//
//  ZiDianVC.swift
//  First1
//
//  Created by New on 2022/8/24.
//

import UIKit

class ZiDianVC:UIViewController {
    
    override func viewDidLoad() {
    
        test6()
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
    
    
}
