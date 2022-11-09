//
//  Test2.swift
//  SwiftTest
//
//  Created by New on 2022/11/8.
//

import UIKit

class Test2:BaseViewController {
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
    }
    
    override func setupUI() {
        
        let mode:NavTitleModel = titleView.model ?? NavTitleModel()
        
        mode.title = "消息"
        
        titleView.model = mode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let nav:BaseNavigationController = self.navigationController as! BaseNavigationController
        
        nav.setBarStyleWithStyle(style: UIStatusBarStyle.lightContent)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc:XunHuanVC = XunHuanVC()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
