//
//  NavTest3.swift
//  First1
//
//  Created by New on 2022/11/9.
//

import Foundation

class NavTest3:BaseViewController {
    
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
    }
    
}
