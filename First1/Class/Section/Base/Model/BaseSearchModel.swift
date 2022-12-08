//
//  BaseSearchModel.swift
//  First1
//
//  Created by New on 2022/12/5.
//

import Foundation

class BaseSearchModel:BaseModel {
    
    var city:String = ""
    var loactionCount:Int = 0
    var statusBarStyle:UIStatusBarStyle = UIStatusBarStyle.default
    
    //nav status
    enum navStatusType {
        
        //tablewView滚动出NavHeight范围到上面范围
        case scollOutNavHeightUp
        //tablewView滚动进NavHeight范围上半
        case scollHalfNavHeightUp
        //tablewView滚动进NavHeight范围下半
        case scollHalfNavHeightDown
        //tablewView滚动出NavHeight范围到下面范围
        case scollOutNavHeightDown
    }
    
    var navStatus:navStatusType = navStatusType.scollOutNavHeightUp
    
    var subModelArray:[Any] = []
}
