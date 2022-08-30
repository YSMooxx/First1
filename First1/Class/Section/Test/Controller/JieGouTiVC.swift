//
//  JieGouTiVC.swift
//  First1
//
//  Created by New on 2022/8/30.
//

import UIKit

class JieGouTiVC:UIViewController {
    
    override func viewDidLoad() {
        
        test3()
    }
    
    //语法
    struct MarkStruct{
       var mark1: Int
       var mark2: Int
       var mark3: Int
    }
    
    //实例1
    func test1() {
        
        var mark = MarkStruct(mark1: 20, mark2: 30, mark3: 40)
        mark.mark1 = 30
        print(mark.mark1)
    }
    
    //实例2
    struct MarksStruct2 {
       var mark: Int

       init(mark: Int) {
          self.mark = mark
       }
    }
    
    func test2() {
        
        let aStruct = MarksStruct2(mark: 98)
        var bStruct = aStruct // aStruct 和 bStruct 是使用相同值的结构体！
        bStruct.mark = 97
        print(aStruct.mark) // 98
        print(bStruct.mark) // 97
    }
    
    //实列3
    struct markStruct3{
        var mark1: Int
        var mark2: Int
        var mark3: Int
        
        init(mark1: Int, mark2: Int, mark3: Int){
            self.mark1 = mark1
            self.mark2 = mark2
            self.mark3 = mark3
        }
    }
    
    func test3() {
        
        print("优异成绩:")
        let marks = markStruct3(mark1: 98, mark2: 96, mark3:100)
        print(marks.mark1)
        print(marks.mark2)
        print(marks.mark3)

        print("糟糕成绩:")
        let fail = markStruct3(mark1: 34, mark2: 42, mark3: 13)
        print(fail.mark1)
        print(fail.mark2)
        print(fail.mark3)
    }
}
