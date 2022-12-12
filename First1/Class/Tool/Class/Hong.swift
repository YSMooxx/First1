//
//  Hong.swift
//  First1
//
//  Created by New on 2022/9/9.
//

import Foundation
import UIKit
import SnapKit

let ScreenW:CGFloat = UIScreen.main.bounds.size.width

let ScreenH:CGFloat = UIScreen.main.bounds.size.height

let mColor:UIColor = UIColor.colorWithHex(hexStr: "#35AA79")

let tColor:UIColor = UIColor.colorWithHex(hexStr: "#f8f8f8")

let bColor:UIColor = UIColor.colorWithHex(hexStr: "#F03752")

let mColorA:UIColor = UIColor.coloWithHex(hexStr: "#41AF9B", alpha: 0.1)

var tabHeight:CGFloat = 49

var navHeight:CGFloat = 0

var isLiuHai = false

var statusBarHeight:CGFloat = 0

let RW:CGFloat = RScreenW()

let RH:CGFloat = RScreenH()

let baseUrl = "https://"

func RScreenW() -> CGFloat {

    return ScreenW / 375
}

func RScreenH() -> CGFloat {
    
    return ScreenH / 667
}

#if !DEBUG

    public func print(_ items: Any...) {
        
    }

#endif
