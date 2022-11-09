//
//  Test1.swift
//  SwiftTest
//
//  Created by New on 2022/11/8.
//

import UIKit

class Test1:BaseViewController {
    
    var bottomView:UIView?
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
    }

    
    override func setupUI() {
        
        let mode:NavTitleModel = titleView?.model ?? NavTitleModel()
        
        mode.title = "首页"
        
        titleView?.model = mode
        
        bottomView = UIView()
        
        bottomView?.backgroundColor = UIColor.orange
        
        view.addSubview(bottomView!)
        
    }
    
    override func viewWillLayoutSubviews() {
        
        bottomView?.snp.makeConstraints({ make in
            
            make.width.equalTo(ScreenW)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(tabHeight)
            
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let nav:BaseNavigationController = self.navigationController as! BaseNavigationController
        
        nav.setBarStyleWithStyle(style: UIStatusBarStyle.lightContent)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc = NavTest3.init()
        
        vc.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


