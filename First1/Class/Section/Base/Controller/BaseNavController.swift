//
//  BaseNavController.swift
//  First1
//
//  Created by New on 2022/11/8.
//

import Foundation
import UIKit

class BaseNavController:UIViewController {
    
    var titleView:NavTitleView? = nil
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        setupDefault()
        
        setupUI()
    }
    
    func setupDefault() {
        
        let titleView1:NavTitleView = NavTitleView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: navHeight))
        
        titleView = titleView1
        
        view.addSubview(titleView!)
    }
    
    func setupUI() {
        
        
    }
    
}
