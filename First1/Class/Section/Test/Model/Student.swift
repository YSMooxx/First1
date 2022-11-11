//
//  Student.swift
//  First1
//
//  Created by New on 2022/8/30.
//

import Foundation

enum sexType {
    
    case nv
    case nan
}

class Student {
    
    var name:String
    var num : Int
    var sex : sexType
    
    init(name:String,num:Int,sex:sexType){
        
        self.name = name
        self.num = num
        self.sex = sex
    }
}

class SampleClass2 {
    
    let myProperty: String
    init(s: String) {
        myProperty = s
    }
}


