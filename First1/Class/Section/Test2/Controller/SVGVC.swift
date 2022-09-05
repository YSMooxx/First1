//
//  SVGVC.swift
//  First1
//
//  Created by New on 2022/9/3.
//

import UIKit
import Foundation

class SVGVC : UIViewController {
    
    override func viewDidLoad() {
    
        setupUI1()
        
        self.view.backgroundColor = UIColor.zhuColor()
    }
    
    func setupUI() {
        
        var  image:UIImage = UIImage.init(named: "tabbar_bill_normal")!
        
        image=image.isRoundCorner(radius: 50, byRoundingCorners: UIRectCorner.allCorners, imageSize: image.size) ?? UIImage()
        
        let imageView:UIImageView = UIImageView.init(image: image)
        
        imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        self.view.addSubview(imageView)
        
    }
    
    //1
    func setupUI1() {
        
        
        let image1:UIImage = UIImage.svgWithName(name: "biaoqian", size: CGSize(width: 300, height: 300), color: UIColor.colorWithHex(hexStr: "ADFF2F"))
        
        let imageView :UIImageView = UIImageView.init(image: image1)
        
        imageView.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
        
        self.view.addSubview(imageView)
    }
    
    //2
    func setupUI2() {
        
        
        let image1:UIImage = UIImage.svgWithName(name: "biaoqian", size: CGSize(width: 300, height: 300))
        
        let imageView :UIImageView = UIImageView.init(image: image1)
        
        imageView.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
        
        self.view.addSubview(imageView)
    }
    
    //桥接OC变色
    func changeColor() {
        
        
        let image2:UIImage = UIImage.svgImageNamed("biaoqian", size: CGSize(width: 300, height: 300), tintColor: UIColor.colorWithHex(hexStr: "00ff00"))
        
        let imageView :UIImageView = UIImageView.init(image: image2)
        
        imageView.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
        
        self.view.addSubview(imageView)
    }
    
    
}
