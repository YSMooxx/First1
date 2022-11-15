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
    
    let model:BaseTableViewModel = BaseTableViewModel()
    
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
    
    func setupUI() {
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        changBarStyleWithStyle()
    }
    
    func changBarStyleWithStyle() {
        
        let nav:BaseNavigationController = self.navigationController as? BaseNavigationController ?? BaseNavigationController()
        
        nav.setBarStyleWithStyle(style: model.statusBarStyle)
    }
    
    
    
}

extension BaseViewController:UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        
    }
    
}

extension BaseViewController:NavTitleViewDelegate {
    
    func changTopWith(status: Bool) {
        
    }
    
    
    
    func setTableViewWith(top: CGFloat) {
        
        
    }
    
    
    
    func didBackButton() {
        
        let count : Int = navigationController?.children.count ?? 0
        
        if(count > 1) {
            
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    
}





