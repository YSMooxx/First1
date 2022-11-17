//
//  CacheManager.swift
//  First1
//
//  Created by New on 2022/11/16.
//

import Foundation

class CacheManager:NSObject {
    
    class var shard:CacheManager{
        
        struct Static {
            
            static let shard:CacheManager = CacheManager()
        }
    
        return Static.shard
    }
    
    var isCancell = true

    func getCacheSize(result1:@escaping (_ size1:String)->Void) {
        
        if !isCancell {
            
            return
        }
        
        let queue = DispatchQueue(label: "queue")
        
        isCancell = false
        
        queue.async {
            
            let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
            let fileArr = FileManager.default.subpaths(atPath: cachePath!)
            var size = 0
            for file in fileArr! {
                
                Thread.sleep(forTimeInterval: 0.1)
                
                if (self.isCancell) {
                    
                    return
                }else {
                    
                    let path = cachePath! + "/\(file)"
                    let floder = try! FileManager.default.attributesOfItem(atPath: path)
                    for (key, fileSize) in floder {
                        
                        if (self.isCancell) {
                            
                            return
                        }else {
                            
                            if key == FileAttributeKey.size {
                                size += (fileSize as AnyObject).integerValue
                            }
                        }
                        
                    }
                }
                
            }
            
            let queue1 = DispatchQueue.main
            
            queue1.async {
                
                self.isCancell = true
                result1(self.fileSizeWithIntegr(size: Int(size)))
            }
            
        }
        
    }

    func clearCache(result2:@escaping ()->Void) {
        
        if !isCancell {
            
            return
        }
        
        isCancell = false
        
        let queue = DispatchQueue(label: "queue")
        
        queue.async {
            
            let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
            let fileArr = FileManager.default.subpaths(atPath: cachePath!)
            for file in fileArr! {
                
                Thread.sleep(forTimeInterval: 0.1)
                
                if (self.isCancell) {
                    
                    return
                }else {
                    
                    let path = cachePath! + "/\(file)"
                    if FileManager.default.fileExists(atPath: path) {
                        do {
                            try FileManager.default.removeItem(atPath: path)
                        }catch {
                            
                        }
                    }
                }
                
                
            }
            
            let queue1 = DispatchQueue.main
            
            queue1.async {
                
                self.isCancell = true
                result2()
            }
            
        }
        
    }

    func fileSizeWithIntegr(size:Int) -> String {

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
