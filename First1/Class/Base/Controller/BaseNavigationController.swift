//
//  File.swift
//  SwiftTest
//
//  Created by New on 2022/11/8.
//

import UIKit

class BaseNavigationController:UINavigationController, UIGestureRecognizerDelegate {
    
    var barStatyl:UIStatusBarStyle = .lightContent
    var curVC:UIViewController?
    
    override func viewDidLoad() {
        
        setupUI()
    }
    
    func setupUI()  {
    
        interactivePopGestureRecognizer?.delegate = self
        
        navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if children.count == 1 {
            
            return false
        }
        
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return barStatyl
    }
    
    func setBarStyleWithStyle(style:UIStatusBarStyle) {
        
        barStatyl = style
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    
}
