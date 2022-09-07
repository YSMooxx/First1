//
//  UIView+SVGKit.swift
//  First1
//
//  Created by New on 2022/9/5.
//

import Foundation
import UIKit
import SVGKit

extension UIView {
    
    class func SVGViewWithName(name:String) -> UIView{
        
        let svgImage:SVGKImage = SVGKImage.init(named: name)
        
        let imageView:UIView = SVGKFastImageView.init(svgkImage: svgImage)
        
        return imageView
    }
}
