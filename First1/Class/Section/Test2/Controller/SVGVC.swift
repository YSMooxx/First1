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
        setupUI()
    }
    
    //设置SVG图片
    func setupUI() {
        
        let svgImage:UIImage = SVGKImage.init(named: "baobiao").uiImage
        
        let imageView:UIImageView = UIImageView.init(image: svgImage)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        
        self.view.addSubview(imageView)
    }
    
    func setupUI2() {
        
        
//        let image1:UIImage = UIImage.init(named: "biaoqian")!
//        let image1:UIImage = MessageVC.image(withName: "tabbar_bill_normal")!
        
//        let image1:UIImage = UIImage.init(named: "tabbar_bill_selected", in: Bundle.main, with: UIImage.Configuration)
        
        let image1:UIImage = MessageVC.image(withName: "shebei")
        
        let imageView:UIImageView = UIImageView.init(image: image1)
        
        imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        self.view.addSubview(imageView)
    }
    
    func setupUI3() {
        
        
    }
    
    //桥接OC变色
    func changeColor() {
        
        self.view.backgroundColor = MessageVC.changeColor()
    }
    
    
}
