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
        
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: self)
        return result
        
    }
    
    // 获取缓存
    static func getCacheSize(result1:@escaping (_ size1:String)->Void) {
        
        let queue = DispatchQueue(label: "queue")
        
        queue.async {
            
            let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
            let fileArr = FileManager.default.subpaths(atPath: cachePath!)
            var size = 0
            for file in fileArr! {
                let path = cachePath! + "/\(file)"
                let floder = try! FileManager.default.attributesOfItem(atPath: path)
                for (key, fileSize) in floder {
                    if key == FileAttributeKey.size {
                        size += (fileSize as AnyObject).integerValue
                    }
                    
                }
            }
            
            let queue1 = DispatchQueue.main
            
            queue1.async {
                
                result1(Self.fileSizeWithIntegr(size: Int(size)))
            }
            
        }
        
    }
    //删除缓存
    static func clearCache(result2:@escaping ()->Void) {
        
        let queue = DispatchQueue(label: "queue")
        
        queue.async {
            
            let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
            let fileArr = FileManager.default.subpaths(atPath: cachePath!)
            for file in fileArr! {
                let path = cachePath! + "/\(file)"
                if FileManager.default.fileExists(atPath: path) {
                    do {
                        try FileManager.default.removeItem(atPath: path)
                    }catch {
                        
                    }
                }
            }
            
            let queue1 = DispatchQueue.main
            
            queue1.async {
                
                result2()
            }
            
        }
        
        
        
    }
    
    static func fileSizeWithIntegr(size:Int) -> String {
        
        var sizeString:String?
        
        if (size < 1024) {//小于1K
            
            sizeString = String(size) + "dB"
        }else if (size < 1024 * 1024 ) {//小于1M
            
            let sizeK:Float = Float(size) / 1024
            sizeString = String(format:"%.2f",sizeK) + "K"
        }else if (size < 1024 * 1024 * 1024) {//小于1G
            
            let sizeM:Float = Float(size) / 1024 / 1024
            sizeString = String(format:"%.2f",sizeM) + "M"
        }else {
            
            let sizeG:Float = Float(size) / 1024 / 1024 / 1024
            sizeString = String(format:"%.2f",sizeG) + "G"
        }
        
        return sizeString ?? ""
    }

    
    
}
