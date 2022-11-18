//
//  UIImageView+Extension.swift
//  First1
//
//  Created by New on 2022/11/14.
//

import UIKit

import SDWebImage

@objc extension UIImageView {
    
    func setImageWithUrl(urlString:String,placeholderImage:String,result: @escaping ( _ image2:UIImage, _ error1:NSError)->Void){
        
        if urlString.isUrlString() {
         
            let URl:NSURL = NSURL.init(string: urlString)!
            
            self.sd_setImage(with: URl as URL, placeholderImage: UIImage.init(named: placeholderImage), options: SDWebImageOptions.refreshCached) { image1, error, cacheType, url in
            
                if (error == nil) {
                    
                    result(image1 ?? UIImage(),NSError(domain: "正常", code: 100, userInfo: nil))
                }else {
                    
                    result(UIImage(),error! as NSError)
                }
                
            }
            
        }else {
            
            result(UIImage(),NSError(domain: "url不正确", code: 110, userInfo: nil))
        }
        
    }
}
