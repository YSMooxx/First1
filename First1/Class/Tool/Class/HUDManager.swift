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
    
    func show() {
        
        SVProgressHUD.show()
    }
    
    func dismiss() {
        
        SVProgressHUD.dismiss()
    }
}


