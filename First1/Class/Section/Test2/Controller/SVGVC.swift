//
//  SVGVC.swift
//  First1
//
//  Created by New on 2022/9/3.
//

import UIKit
import SVGKit
import Foundation

class SVGVC : UIViewController {
    
    override func viewDidLoad() {
    
//        setupUI2()
        
        self.view.backgroundColor = UIColor.coloWithHex(hexStr: "C71585")
        setupUI()
    }
    
    //设置SVG图片
    func setupUI() {
        
        let svgImage:SVGKImage = SVGKImage.init(named: "biaoqian")
        
        let imageView:UIView = SVGKFastImageView.init(svgkImage: svgImage)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        
        self.view.addSubview(imageView)
    }
    
    func setupUI2() {
        
        var  image:UIImage = UIImage.init(named: "tabbar_bill_normal")!
        
        image = image.isRoundCorner(radius: 50, byRoundingCorners: UIRectCorner.allCorners, imageSize: image.size) ?? UIImage()
        
        let imageView:UIImageView = UIImageView.init(image: image)
        
        imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        self.view.addSubview(imageView)
        
    }
    
    //桥接OC变色
    func changeColor() {
        
        self.view.backgroundColor = MessageVC.changeColor()
    }
    
    
}
