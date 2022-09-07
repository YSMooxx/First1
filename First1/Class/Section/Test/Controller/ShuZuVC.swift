//
//  ShuZuVC.swift
//  First1
//
//  Created by New on 2022/8/23.
//

import UIKit

class ShuZuVC : UIViewController {
    
    override func viewDidLoad() {
    
        test6()
    }
    
    //创建数组
    func test1() {
        
        let someArray = [Int](repeating: 0, count: 3)
        print(someArray)
        
        let someInts = [10,20,30]
        print(someInts)
    }
    
    //访问数组
    func test2() {
        
        let someInts = [10,20,30]

        let someVar = someInts[0]

        print( "第一个元素的值 \(someVar)" )
        print( "第二个元素的值 \(someInts[1])" )
        print( "第三个元素的值 \(someInts[2])" )
    }
    
    //修改数组
    func test3() {
        
        var someInts = [Int]()

        someInts.append(20)
        someInts.append(30)
        someInts += [40]
        
        someInts = [100,200,300]
        someInts[1] = 400
        
        let someVar = someInts[0]

        print( "第一个元素的值 \(someVar)" )
        print( "第二个元素的值 \(someInts[1])" )
        print( "第三个元素的值 \(someInts[2])" )
    }
    
    //遍历数组
    func test4() {
        
        var someStrs = [String]()

        someStrs.append("Apple")
        someStrs.append("Amazon")
        someStrs.append("Runoob")
        someStrs += ["Google"]

        for item in someStrs {
           print(item)
        }
        
        for (index, item) in someStrs.enumerated() {
            print("在 index = \(index) 位置上的值为 \(item)")
        }
    }
    
    //合并数组
    func test5() {
        
        let intsA = [Int](repeating: 2, count:2)
        let intsB = [Int](repeating: 1, count:3)
        let intsC = intsA + intsB

        for item in intsC {
            print(item)
        }
    }
    
    //isEmpty 属性
    func test6() {
        
        let intsA = [Int](repeating: 2, count:2)
        let intsB = [Int](repeating: 1, count:3)
        let intsC = [Int]()

        print("intsA.isEmpty = \(intsA.isEmpty)")
        print("intsB.isEmpty = \(intsB.isEmpty)")
        print("intsC.isEmpty = \(intsC.isEmpty)")
    }
}
