//
//  LeiVC.swift
//  First1
//
//  Created by New on 2022/8/30.
//

import UIKit

class LeiVC:UIViewController {
    
    override func viewDidLoad() {
        
        test2()
        
        view.backgroundColor = .white
    }
    
    //
    func test1() {
        
        let student1 = Student(name: "小红", num: 16, sex: sexType.nv)
        student1.num = 17
        print(student1.name,student1.num,student1.sex)
    }
    
    //恒等运算符
    func test2() {
        
        let spClass1 = SampleClass2(s: "Hello")
        let spClass2 = SampleClass2(s: "Hello")

        if spClass1 === spClass2 {// false
            print("引用相同的类实例 \(spClass1)")
        }

        if spClass1 !== spClass2 {// true
            print("引用不相同的类实例 \(spClass2)")
        }
    }
    
    
}


