//
//  BaseTableViewModel.swift
//  First1
//
//  Created by New on 2022/11/11.
//

import Foundation
import UIKit
import HandyJSON

class BaseTableViewModel:BaseModel {
    
    var statusBarStyle:UIStatusBarStyle = UIStatusBarStyle.default
    
    var oy:Int = 0
    
    var subModelArray:NSMutableArray = NSMutableArray()
    
    var subModelArray2:NSMutableArray = NSMutableArray()
    
    var jsonArray:[Any] = []
    
    func jsonZhuanModelWithTypel( _ modelType:HandyJSON.Type,jsonArray1:[Any],result:()->Void) {
        
        jsonArray = jsonArray1
        
        let jsonString:String = JsonUtil.getJSONStringFromArray(array:jsonArray1)
        
        let array:[Any]  = JsonUtil.jsonArrayToModel(jsonString,modelType.self)
        
        for model in array {
            
            subModelArray.add(model)
        }
        
        result()
        
    }
    
}
