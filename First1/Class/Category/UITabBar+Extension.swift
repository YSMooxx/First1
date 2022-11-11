//
//  UITabBar+Extension.swift
//  First1
//
//  Created by New on 2022/11/3.
//

import Foundation
import UIKit

extension UITabBar {
    
    func showBadeOnItemIndex(index:Int) {
        
        removeBadgeOnItemIndex(index: index)
        
        //新建小红点
        let badgeView = UIView()
        badgeView.tag = 888 + index
        badgeView.layer.cornerRadius = 5
        badgeView.backgroundColor = UIColor.red
        //确定小红点位置
        let percentX = (Double(index) + 0.6) / 4
        let x = ceilf(Float(percentX) * Float(percentX))
        let y = ceilf(Float(percentX) * Float(percentX))
        
        badgeView.frame = CGRect(x: CGFloat(x), y: CGFloat(y), width: 10, height: 10)
        
        addSubview(badgeView)
    }
    
    func hideBadgeOnItemIndex(index:Int) {
        
        
        removeBadgeOnItemIndex(index: index)
    }
    
    func removeBadgeOnItemIndex(index:Int) {
        
        for itemView in self.subviews {
            
            if(itemView.tag == 888 + index) {
                
                itemView.removeFromSuperview()
            }
        }
    }
    
}
