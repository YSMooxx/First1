//
//  gaodeDataModel.swift
//  First1
//
//  Created by New on 2022/11/29.
//

import Foundation

class gaodeDataModel:BaseModel {
    
    var status:String?
    
    var regeocode:Regeocode?
}

class Regeocode:BaseModel {
    
    var addressComponent:Address?
}

class Address:BaseModel {
    
    var city:String? = ""
    var citycode:Int? = 0
    var country:String? = ""
    var district:String? = ""
}
