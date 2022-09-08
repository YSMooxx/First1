//
//  UserDef.swift
//  First1
//
//  Created by New on 2022/9/8.
//

import Foundation

var userDef : UserDef = UserDef.init()

class UserDef:NSObject {
    
    var name:String? = ""
    var num:String? = ""
    
    override init() {
        
        let defaults:UserDefaults = UserDefaults.standard
        self.name = defaults.value(forKey: "name") as? String ?? ""
        
        self.num = defaults.value(forKey: "num") as? String ?? ""
        
    }
    
    class func saveUserDefToSandBox() {
        
        let defaults:UserDefaults = UserDefaults.standard
        
        defaults.setValue(userDef.name, forKey: "name")
        defaults.setValue(userDef.num, forKey: "num")
        defaults.synchronize()
    }
}
