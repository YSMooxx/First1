//
//  Test1.swift
//  SwiftTest
//
//  Created by New on 2022/11/8.
//

import UIKit

class Test1:BaseViewController {
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
    }

    
    override func setupUI() {
        
        model.statusBarStyle = .lightContent
        
        let mode:NavTitleModel = titleView.model ?? NavTitleModel()
        
        mode.title = "首页"
        
        titleView.model = mode
        
        changBarStyleWithStyle()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc = NavTest3.init()
        
        vc.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

