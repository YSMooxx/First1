//
//  UserDef.swift
//  First1
//
//  Created by New on 2022/9/8.
//

import Foundation

class UserDef:NSObject {
    
    var name:String? = ""
    var num:String? = ""
    var token:String? = ""
    var dCity:String? = "同城"
    var xCity:String? = "同城"
    var wRatio:CGFloat = 1
    var hRatio:CGFloat = 1
    var locationTime:Int = 0

    override init() {
        
        let defaults:UserDefaults = UserDefaults.standard
        self.name = defaults.value(forKey: "name") as? String ?? ""
        self.num = defaults.value(forKey: "num") as? String ?? ""
        self.token = defaults.value(forKey: "token") as? String ?? ""
        self.dCity = defaults.value(forKey: "dCity") as? String ?? "同城"
        self.xCity = defaults.value(forKey: "xCity") as? String ?? "同城"
        self.wRatio = defaults.value(forKey: "wRatio") as? CGFloat ?? 1
        self.hRatio = defaults.value(forKey: "hRatio") as? CGFloat ?? 1
        self.locationTime = defaults.value(forKey: "locationTime") as? Int ?? 0
        
    }
    
    public class var shard:UserDef{
        
        struct Static {
            
            static let shard:UserDef = UserDef()
        }
        
        return Static.shard
    }
    
    class func saveUserDefToSandBox() {
        
        let defaults:UserDefaults = UserDefaults.standard
        
        defaults.setValue(shard.name, forKey: "name")
        defaults.setValue(shard.num, forKey: "num")
        defaults.setValue(shard.token, forKey: "token")
        defaults.setValue(shard.dCity, forKey: "dCity")
        defaults.setValue(shard.xCity, forKey: "xCity")
        defaults.setValue(shard.wRatio, forKey: "wRatio")
        defaults.setValue(shard.hRatio, forKey: "hRatio")
        defaults.setValue(shard.locationTime, forKey: "locationTime")
        
        defaults.synchronize()
    }
}
