//
//  UIImageView+Extension.swift
//  First1
//
//  Created by New on 2022/11/14.
//

import UIKit

import SDWebImage

@objc extension UIImageView {
    
    func setImageWithUrl(urlString:String,placeholderImage:String){
        
        if urlString.isUrlString() {
         
            let URl:NSURL = NSURL.init(string: urlString)!
            
            self.sd_setImage(with: URl as URL, placeholderImage: UIImage.init(named: placeholderImage), options: SDWebImageOptions.refreshCached) { image1, error, cacheType, url in
                
            }
            
        }
        
    }
}
