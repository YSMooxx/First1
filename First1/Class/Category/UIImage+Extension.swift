//
//  UIImage+SVGKit.swift
//  First1
//
//  Created by New on 2022/9/5.
//

import Foundation
import UIKit
import SVGKit

extension UIImage {
    
    //image切圆角
    func isRoundCorner(radius: CGFloat = 3, byRoundingCorners corners: UIRectCorner = .allCorners, imageSize: CGSize?) -> UIImage? {
            let weakSize = imageSize ?? size
            let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: weakSize)
            // 开始图形上下文
            UIGraphicsBeginImageContextWithOptions(weakSize, false, UIScreen.main.scale)
            guard let contentRef: CGContext = UIGraphicsGetCurrentContext() else {
                // 关闭上下文
                UIGraphicsEndImageContext();
                return nil
            }
            // 绘制路线
            contentRef.addPath(UIBezierPath(roundedRect: rect,
                                        byRoundingCorners: UIRectCorner.allCorners,
                                        cornerRadii: CGSize(width: radius, height: radius)).cgPath)
            // 裁剪
            contentRef.clip()
            // 将原图片画到图形上下文
            draw(in: rect)
            contentRef.drawPath(using: .fillStroke)
            guard let output = UIGraphicsGetImageFromCurrentImageContext() else {
            // 关闭上下文
                UIGraphicsEndImageContext();
                return nil
            }
           // 关闭上下文
            UIGraphicsEndImageContext();
            return output
        }
    
    //改变image颜色
    func changColorWithcolor(color:UIColor) -> UIImage {
        
        UIGraphicsBeginImageContext(self.size)

        color.setFill()

        let bounds = CGRect.init(x:0, y:0,width:self.size.width,height:self.size.height)

        UIRectFill(bounds)

        self.draw(in: bounds, blendMode:CGBlendMode.destinationIn, alpha:1.0)
        
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return tintedImage!

    }
    
    //创建svg通过名称
    class func svgWithName(name:String) ->UIImage {
        
        return SVGKImage.init(named: name).uiImage
    }
    
    //创建svg通过名称、尺寸
    class func svgWithName(name:String,size:CGSize) ->UIImage {
        
        let svgImage:SVGKImage = SVGKImage.init(named: name)
        
        svgImage.size = size
        
        return svgImage.uiImage
    }
    
    //创建svg通过名称、尺寸
    class func svgWithName(name:String,color:UIColor) ->UIImage {
        
        let svgImage:SVGKImage = SVGKImage.init(named: name)
        
        return svgImage.uiImage.changColorWithcolor(color: color)
    }
    
    //创建svg通过名称、尺寸、颜色
    class func svgWithName(name:String,size:CGSize,color:UIColor) -> UIImage {
        
        let svgImage:SVGKImage = SVGKImage.init(named: name)
        
        svgImage.size = size
       
        let colorImage:UIImage = svgImage.uiImage
        
        return colorImage.changColorWithcolor(color: color)
        
    }

}
