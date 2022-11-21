//
//  HUDManager.swift
//  First1
//
//  Created by New on 2022/11/16.
//

import Foundation
import SVProgressHUD

class HUDManager:NSObject {
    
    class var shard:HUDManager{
        
        struct Static {
            
            static let shard:HUDManager = HUDManager()
        }
        
        return Static.shard
    }
    
    static func show() {
        
        SVProgressHUD.show()
    }
    
    static func dismiss() {
        
        SVProgressHUD.dismiss()
    }
    
    static func dismissWithDelay(time:Double) {
        
        SVProgressHUD.dismiss(withDelay: time)
    }
    
    static func shouTextWithString(text:String) {
        
        SVProgressHUD.show(withStatus: text)
    }
}


