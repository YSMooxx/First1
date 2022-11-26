//
//  CityTitleModel.swift
//  First1
//
//  Created by New on 2022/11/24.
//

import Foundation

class CityTitleModel:BaseModel {
    
    enum searchViewStatus {
        
        case cancelEdit
        case searchClick
    }
    
    var status:searchViewStatus = .cancelEdit
    var title:String = ""
}
