//
//  gaodeDataModel.swift
//  First1
//
//  Created by New on 2022/11/29.
//

import Foundation

class gaodeDataModel:BaseModel {
    
    var status:String?
    
    var info:String?
    
    var infocode:Int?
    
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

class gaodeHeaderModel:NetBaseModel {
    
    override var url: String {
        
        get {
            
            return baseUrl + "restapi.amap.com/v3/geocode/regeo"
        }
    }
    
    override var method: String {
        
        get {
            
            return "GET"
        }
    }
}

class gaodeParameterModel:BaseModel {
    
    var key:String? = "ce6391b3276fa3f7d396c72fef20f9cf"
    var location:String? = ""
}


