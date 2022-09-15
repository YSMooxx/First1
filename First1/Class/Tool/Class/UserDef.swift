//
//  UserDef.swift
//  First1
//
//  Created by New on 2022/9/8.
//

import Foundation

//var userDef : UserDef = UserDef.init()

class UserDef:NSObject {
    
    var name:String? = ""
    var num:String? = ""
    var wRatio:CGFloat = 1
    var hRatio:CGFloat = 1
    
    override init() {
        
        let defaults:UserDefaults = UserDefaults.standard
        self.name = defaults.value(forKey: "name") as? String ?? ""
        self.num = defaults.value(forKey: "num") as? String ?? ""
        self.wRatio = defaults.value(forKey: "wRatio") as? CGFloat ?? 1
        self.hRatio = defaults.value(forKey: "hRatio") as? CGFloat ?? 1
        
    }
    
    public class var userDef : UserDef{
        
        struct Static {
            static let instance :UserDef = UserDef()
        }
        
        return Static.instance
    }
    
    class func saveUserDefToSandBox() {
        
        let defaults:UserDefaults = UserDefaults.standard
        
        defaults.setValue(userDef.name, forKey: "name")
        defaults.setValue(userDef.num, forKey: "num")
        defaults.setValue(userDef.wRatio, forKey: "wRatio")
        defaults.setValue(userDef.hRatio, forKey: "hRatio")
        
        defaults.synchronize()
    }
}
