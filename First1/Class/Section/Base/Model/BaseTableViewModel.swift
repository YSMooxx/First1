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
    
    func jsonZhuanModelWithTypel( _ modelType:HandyJSON.Type,jsonArray1:[Any],jsonArray2:[Any],result:(_ array1:[Any],_ array2:[Any])->Void) {
        
        let jsonString1:String = JsonUtil.getJSONStringFromArray(array:jsonArray1)
        
        let jsonString2:String = JsonUtil.getJSONStringFromArray(array:jsonArray2)
        
        let array1:[Any]  = JsonUtil.jsonArrayToModel(jsonString1,modelType.self)
        
        let array2:[Any]  = JsonUtil.jsonArrayToModel(jsonString2,modelType.self)
        
        for model in array1 {
            
            subModelArray.add(model)
        }
        
        for model in array2 {
            
            subModelArray2.add(model)
        }
        
        result(array1,array2)
        
    }
    
}
