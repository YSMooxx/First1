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
    
    func isUrlString() -> Bool {
        
//        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlRegEx = "((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: self)
        return result
        
    }
    
    func isIncludeChineseIn() -> Bool {
        
        for (_, value) in self.enumerated() {
            
            if ("\u{4E00}" <= value  && value <= "\u{9FA5}") {
                return true
            }
        }
        
        return false
    }
    
    func chineseToPinyin() -> String {
        
        let stringRef = NSMutableString(string: self) as CFMutableString
        // 转换为带音标的拼音
        CFStringTransform(stringRef,nil, kCFStringTransformToLatin, false)
        // 去掉音标
        CFStringTransform(stringRef, nil, kCFStringTransformStripCombiningMarks, false)
        let pinyin = stringRef as String
        
        return pinyin
    }
    
    func getShouZiMu() -> String {
        
        let result = self.components(separatedBy: " ").map { String($0.prefix(1))}.joined()
        
        return result
    }
    
    var removeAllSapce: String {
        
        var string:String = ""
        
        for c in self {
            
            if c == " " || c == " " {
                
                continue
            }else {
                
                string = string + String(c)
            }
        }
        
        return string
    }
    
}
