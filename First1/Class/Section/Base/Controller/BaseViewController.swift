//
//  BaseViewController.swift
//  First1
//
//  Created by New on 2022/9/9.
//

import Foundation
import UIKit

class BaseViewController:UIViewController,NavTitleViewDelegate {
    
    var titleView:NavTitleView? = nil
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        setupDefault()
        
        setupUI()
    }
    
    func setupDefault() {
        
        view.backgroundColor = .white
        
        let titleView1:NavTitleView = NavTitleView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: navHeight))
        
        titleView = titleView1
        
        view.addSubview(titleView!)
        
        titleView?.delegate = self
        
    }
    
    func setupUI() {
        
        
    }
    
    func didBackButton() {
        
        let count : Int = navigationController?.children.count ?? 0
        
        if(count > 1) {
            
            navigationController?.popViewController(animated: true)
        }
    }
    
}





