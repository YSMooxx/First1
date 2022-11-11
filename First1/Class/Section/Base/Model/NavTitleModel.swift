//
//  NavTitleModel.swift
//  First1
//
//  Created by New on 2022/11/8.
//

import Foundation
import UIKit

class NavTitleModel:BaseModel {
    
    enum titleViewStyle {
        
        case Default
        case ScrollShow
        case Other
    }
    
    var title:String = "首页"
    var titleColor:String = "#FFFFFF"
    var backColor:String = "#41AF9B"
    var backBtnHidden:Bool = true
    var viewHideen:Bool = false
    var aplha:Float = 1
    var imageHeight:CGFloat = 2 * navHeight
    var style:titleViewStyle = .Default
    var vcCount:Int = 1
    var backImage:String = "back"
    var bilie:Float = 0
    
}
