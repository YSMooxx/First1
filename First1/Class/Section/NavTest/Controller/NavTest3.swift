//
//  NavTest3.swift
//  First1
//
//  Created by New on 2022/11/9.
//

import Foundation

class NavTest3:BaseViewController {
    
    let imageView:UIImageView = UIImageView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func setupUI() {
        
        model.statusBarStyle = .default
        
        let sMode:NavTitleModel = titleView.model ?? NavTitleModel()
        
        sMode.title = "详情"
        sMode.titleColor = "#000000"
        sMode.backColor = "#f8f8f8"
        sMode.vcCount = navigationController?.children.count ?? 1
        
        titleView.model = sMode
        
        UIImage.initWithUrl(urlString: "http://www.djy-es.com/statics/images/test1.png") {image1 in

            print(image1)
            print(ScreenW,ScreenH)
            self.imageView.width = image1.size.width
            self.imageView.height = image1.size.height
            self.imageView.image = image1
            
        }
        
//        imageView.setImageWithUrl(urlString: "http://www.djy-es.com/statics/images/test12.png")
//
//        imageView.width = 371
//        imageView.height = 190
        
        view.addSubview(imageView)
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        imageView.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
}
