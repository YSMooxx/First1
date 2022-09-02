//
//  SampleClass.swift
//  First1
//
//  Created by New on 2022/9/2.
//

import Foundation

class SampleClass: Equatable {
    
    let myProperty: String
    init(s: String) {
        myProperty = s
    }
    
    static func == (lhs: SampleClass, rhs: SampleClass) -> Bool {
        return lhs.myProperty == rhs.myProperty
    }
}
