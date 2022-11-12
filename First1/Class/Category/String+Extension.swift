//
//  String+extension.swift
//  First1
//
//  Created by New on 2022/11/12.
//

import Foundation
import UIKit

extension String {
    
    func getSizeWithWidth(width:CGFloat,font:UIFont) -> CGSize {
        
        let attributes = [NSAttributedString.Key.font:font]
        
        let size:CGSize = self.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil).size
        
        return size
    }
    
}
