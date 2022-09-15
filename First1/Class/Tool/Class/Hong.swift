//
//  Hong.swift
//  First1
//
//  Created by New on 2022/9/9.
//

import Foundation
import UIKit
import SnapKit

var ScreenW:CGFloat = ScreenWf()

var RScreenW:CGFloat = UserDef.userDef.wRatio * ScreenWf() / 375

var ScreenH:CGFloat = ScreenHf()

var RScreenH:CGFloat = UserDef.userDef.hRatio * ScreenHf() / 667

func ScreenHf() -> CGFloat {
    
    return UIScreen.main.bounds.size.height
}

func ScreenWf() -> CGFloat {
    
    return UIScreen.main.bounds.size.width
}
