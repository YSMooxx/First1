//
//  ListModel.swift
//  First1
//
//  Created by New on 2022/9/12.
//

import Foundation


class ListModel:NSObject {
    
    var name:String = ""
    var icon:String = ""
    
    init(name:String,icon:String) {
        
        self.name = name
        self.icon = icon
    }
}
