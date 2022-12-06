//
//  UIColor+Extension.swift
//  First1
//
//  Created by New on 2022/9/5.
//

import Foundation
import UIKit

extension UIColor {
    
    //string转16进制
    class func colorWithHex(hexStr:String) -> UIColor {
        
        coloWithHex(hexStr: hexStr, alpha: 1)
    }
    
    //string转16进制(带透明度)
    class func coloWithHex(hexStr:String,alpha:Float) -> UIColor {
        
        var  cStr = hexStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased() as NSString

        if(cStr.length < 6) {

            return UIColor.clear
        }

        if(cStr.hasPrefix("0x")) {

            cStr = cStr.substring(from: 2) as NSString
        }

        if(cStr.hasPrefix("#")) {

            cStr = cStr.substring(from: 1) as NSString
        }

        if(cStr.length != 6) {

            return UIColor.clear
        }

        let rStr = (cStr as NSString).substring(to: 2)
        let gStr = ((cStr as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bStr = ((cStr as NSString).substring(from: 4) as NSString).substring(to: 2)

        var r:UInt64 = 0
        var g:UInt64 = 0
        var b:UInt64 = 0

        Scanner.init(string: rStr).scanHexInt64(&r)
        Scanner.init(string: gStr).scanHexInt64(&g)
        Scanner.init(string: bStr).scanHexInt64(&b)

        return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(alpha))
        
    }
    
    //主色调
    class func zhuColor() -> UIColor{
        
        return colorWithHex(hexStr: "#F0F8FF")
    }
    
    //副色调
    class func fuColor() -> UIColor{
        
        return colorWithHex(hexStr: "#444444")
    }
    
    /// 设置随机颜色
    class func colorRandom() -> UIColor
    {
        let color: UIColor = UIColor.init(red: (((CGFloat)((arc4random() % 256)) / 255.0)), green: (((CGFloat)((arc4random() % 256)) / 255.0)), blue: (((CGFloat)((arc4random() % 256)) / 255.0)), alpha: 1.0);
            return color;
    }
}
