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
        
        addSubView1()
    }
    
    //添加子view
    func addSubView1() {
        
        let sView:UIView = UIView.init()
        sView.backgroundColor = UIColor.colorWithHex(hexStr: "#ff0000")
        self.view.addSubview(sView)
        
        sView.snp.makeConstraints { make in
            
            make.width.equalTo(100 * RScreenW)
            make.height.equalTo(100 * RScreenH)
            make.top.equalTo(100 * RScreenH)
            make.centerX.equalToSuperview()
        }
    }
}
