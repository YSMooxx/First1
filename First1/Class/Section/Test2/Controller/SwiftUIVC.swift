//
//  SwiftUIVC.swift
//  First1
//
//  Created by New on 2022/9/9.
//

import Foundation
import UIKit


class SwiftUIVC:BaseViewController {
    
    override func viewDidLoad() {
        
//        addSubView1()
        addSubView2()
    }
    
    //添加子view
    func addSubView1() {
        
        let sView:UIView = UIView.init()
        sView.backgroundColor = UIColor.colorWithHex(hexStr: "#ff0000")
        self.view.addSubview(sView)
        
        sView.snp.makeConstraints { make in
            
            make.width.equalTo(100 * RScreenW())
            make.height.equalTo(100 * RScreenH())
            make.top.equalTo(100 * RScreenH())
            make.centerX.equalToSuperview()
        }
    }
    
    //添加子view2
    func addSubView2() {
        
        let sView:UIImage = UIImage.svgWithName(name: "baobiao", size: CGSize(width: 250, height: 250), color: UIColor.colorWithHex(hexStr: "#20894D"))
        
        let imageView:UIImageView = UIImageView.init(image: sView)
        
        self.view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            
            make.top.equalTo(150)
            make.centerX.equalToSuperview()
        }
    }
    

}
