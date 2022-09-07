//
//  MeiJuVC.swift
//  First1
//
//  Created by New on 2022/8/29.
//

import UIKit

class MeiJuVC:UIViewController {
    
    override func viewDidLoad() {
        
       test3()
    }
    
    //枚举
    enum DaysofaWeek {
        case Sunday
        case Monday
        case TUESDAY
        case WEDNESDAY
        case THURSDAY
        case FRIDAY
        case Saturday
    }
    
    //实例
    func test1() {
        
        var weekDay = DaysofaWeek.THURSDAY
        weekDay = .Saturday
        print(weekDay)
    }
    
    //相关值
    enum Student{
        case Name(String)
        case Mark(Int,Int,Int)
    }
    
    func test2() {
        
        let studDetails = Student.Name("Runoob")
        let studMarks = Student.Mark(98,97,95)
//        switch studMarks {
//            case .Name(let studName):
//                print("学生的名字是: \(studName)。")
//            case .Mark(let Mark1, let Mark2, let Mark3):
//                print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
//        }
        
        print(studDetails,studMarks)
        
    }
    
    //原始值
    enum Month: Int {
        case January = 1, February, March, April, May, June, July, August, September, October, November, December
    }
    
    func test3() {
        
        let yearMonth = Month.May.rawValue
        print("数字月份为: \(yearMonth)。")
        print(Month.September.rawValue)
    }
}
