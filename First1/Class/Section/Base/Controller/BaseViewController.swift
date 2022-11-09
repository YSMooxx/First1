//
//  BaseViewController.swift
//  First1
//
//  Created by New on 2022/9/9.
//

import Foundation
import UIKit

class BaseViewController:UIViewController {
    
    let titleView:NavTitleView = NavTitleView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: navHeight))
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        setupDefault()
        
        setupUI()
    }
    
    func setupDefault() {
        
        view.backgroundColor = .white
        
        titleView.frame = CGRect(x: 0, y: 0, width: ScreenW, height: navHeight)
        
        view.addSubview(titleView)
        
        titleView.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
    }
    
    func setupUI() {
        
        
    }
    
}

extension BaseViewController:NavTitleViewDelegate {
    
    func didBackButton() {
        
        let count : Int = navigationController?.children.count ?? 0
        
        if(count > 1) {
            
            navigationController?.popViewController(animated: true)
        }
    }
}





