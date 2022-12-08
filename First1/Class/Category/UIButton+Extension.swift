//
//  UIButton+Extension.swift
//  First1
//
//  Created by New on 2022/11/10.
//

import Foundation
import UIKit

extension UIButton {
    
    enum BtnStyle {
        
        case defalut
        case imageTop
        case imageBottom
        case imageRight
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        var boundCGRect = self.bounds
        
        boundCGRect = CGRectInset(boundCGRect, -10, -10)
        
        return CGRectContainsPoint(boundCGRect, point)
    }
    
    func changBtnWithStytl(btnStyle:BtnStyle,margin:CGFloat) {
        
        switch btnStyle {
            
        case .defalut :
            changBtnStyleImageDefault(margin: margin)
            break
        case.imageTop :
            changBtnStyleImageTop(margin: margin)
            break
        case.imageBottom :
            changBtnStyleImageBottom(margin: margin)
            break
        case.imageRight :
            changBtnStyleImageRight(margin: margin)
            break
        }
    }
    
    private func changBtnStyleImageDefault(margin:CGFloat) {
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -margin)

        imageEdgeInsets = UIEdgeInsets(top: 0, left: -margin, bottom: 0, right: 0)
    }
    
    private func changBtnStyleImageTop(margin:CGFloat) {
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageView?.frame.size.width ?? 0) - margin, bottom: -(imageView?.frame.size.height ?? 0) - margin, right: 0)

        imageEdgeInsets = UIEdgeInsets(top: -(titleLabel?.intrinsicContentSize.height ?? 0), left: 0, bottom: 0, right: -(titleLabel?.intrinsicContentSize.width ?? 0))

    }
    
    private func changBtnStyleImageBottom(margin:CGFloat) {
        
        let margin:CGFloat = 2
        
        titleEdgeInsets = UIEdgeInsets(top: -(imageView?.frame.size.height ?? 0) - margin, left: -((imageView?.frame.size.width ?? 0) - margin), bottom: 0, right: 0)

        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -(titleLabel?.intrinsicContentSize.height ?? 0) - margin, right: -(titleLabel?.intrinsicContentSize.width ?? 0) - margin)

    }
    
    private func changBtnStyleImageRight(margin:CGFloat) {
        
        let margin:CGFloat = 2
        
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -2 * (imageView?.frame.size.width ?? 0) - margin, bottom: 0, right: 0)


        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -2 * (titleLabel?.intrinsicContentSize.width ?? 0) - margin)
    }
    
}
