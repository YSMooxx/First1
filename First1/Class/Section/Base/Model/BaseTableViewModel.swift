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
    
    var arrayCout = 1
    
    var vModelArray:[Any] = []
    
    var sModelArray:[BaseModel] = []
    
    var jsonArray:[Any] = []
    
    func jsonZhuanModelWithTypel( _ modelType:HandyJSON.Type,jsonArray1:[Any],_ vMClass:String) {
        
        vModelArray.removeAll()
        
        let jsonString:String = JsonUtil.getJSONStringFromArray(array:jsonArray1)

        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"]as!String
        
        let vcClass = NSClassFromString(namespace+"."+vMClass)!as!BaseViewModel.Type
        
        for mode in JsonUtil.jsonArrayToModel(jsonString,modelType.self) {

            let vm = vcClass.init()
            
            vm.getdateWithsubModel(vm: mode)

            vModelArray.append(vm)
        }
        
    }
    
    func jsonAddModelWithTypel( _ modelType:HandyJSON.Type,jsonArray1:[Any],_ vMClass:String) {
        
        let jsonString:String = JsonUtil.getJSONStringFromArray(array:jsonArray1)

        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"]as!String
        
        let vcClass = NSClassFromString(namespace+"."+vMClass)!as!BaseViewModel.Type
        
        for mode in JsonUtil.jsonArrayToModel(jsonString,modelType.self) {

            let vm = vcClass.init()
            
            vm.getdateWithsubModel(vm: mode)

            vModelArray.append(vm)
        }
        
    }
    
    func jsonZhuanModelWithTypel( _ modelType:HandyJSON.Type,jsonArray1:[Any]) {
        
        let jsonString:String = JsonUtil.getJSONStringFromArray(array:jsonArray1)

        sModelArray.removeAll()
        
        sModelArray = JsonUtil.jsonArrayToModel(jsonString,modelType.self)
        
    }
    
    func jsonAddModelWithTypel( _ modelType:HandyJSON.Type,jsonArray1:[Any]) {
        
        let jsonString:String = JsonUtil.getJSONStringFromArray(array:jsonArray1)
        
        for sModel in JsonUtil.jsonArrayToModel(jsonString,modelType.self) {
            
            sModelArray.append(sModel)
        }
        
    }
    
}
