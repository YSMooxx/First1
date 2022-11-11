//
//  UIButton+Extension.swift
//  First1
//
//  Created by New on 2022/11/10.
//

import Foundation
import UIKit

extension UIButton {
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        var boundCGRect = self.bounds
        
        boundCGRect = CGRectInset(boundCGRect, -10, -10)
        
        return CGRectContainsPoint(boundCGRect, point)
    }
    
}
