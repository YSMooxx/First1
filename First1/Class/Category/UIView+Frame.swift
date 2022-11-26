//
//  UIView+Frame.swift
//  SwiftTest
//
//  Created by New on 2022/11/8.
//

import UIKit

extension UIView {
    
    var x :CGFloat {
        
        get {
            
            return frame.origin.x
        }
        
        set {
            
            var frame1:CGRect = frame
            frame1.origin.x = newValue
            frame = frame1
            
        }
    }
    
    var y :CGFloat {
        
        get {
            
            return frame.origin.y
        }
        
        set {
            
            var frame1:CGRect = frame
            frame1.origin.y = newValue
            frame = frame1
            
        }
    }
    
    var width :CGFloat {
        
        get {
            
            return frame.size.width
        }
        
        set {
            
            var frame1:CGRect = frame
            frame1.size.width = newValue
            frame = frame1
            
        }
    }
    
    var height :CGFloat {
        
        get {
            
            return frame.size.height
        }
        
        set {
            
            var frame1:CGRect = frame
            frame1.size.height = newValue
            frame = frame1
            
        }
    }
    
    var size :CGSize {
        
        get {
            
            return frame.size
        }
        
        set {
            
            var frame1:CGRect = frame
            frame1.size = newValue
            frame = frame1
            
        }
    }
    
    
}
