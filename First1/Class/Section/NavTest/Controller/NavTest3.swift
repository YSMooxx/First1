//
//  NavTest3.swift
//  First1
//
//  Created by New on 2022/11/9.
//

import Foundation

class NavTest3:BaseNavTableViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func setupUI() {
        
        let mode:NavTitleModel = titleView.model ?? NavTitleModel()
        
        mode.title = "详情"
        mode.titleColor = .black
        mode.backColor = UIColor.colorWithHex(hexStr: "#f8f8f8")
        mode.backBtnHidden = false
        
        titleView.model = mode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let nav:BaseNavigationController = self.navigationController as! BaseNavigationController
        
        nav.setBarStyleWithStyle(style: UIStatusBarStyle.default)
    }
    
}
