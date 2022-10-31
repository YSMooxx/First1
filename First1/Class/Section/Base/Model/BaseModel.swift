//
//  BaseModel.swift
//  First1
//
//  Created by New on 2022/9/13.
//

import Foundation
import UIKit
import HandyJSON

class BaseModel:HandyJSON {

    func toJSONString() -> String{
        
        return "1111"
    }
    
    func toJSON() -> [String:Any]{
        
        return ["1112":"112"]
    }
    
    required init(){}
}
