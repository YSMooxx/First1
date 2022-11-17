//
//  BaseNavTableViewController.swift
//  First1
//
//  Created by New on 2022/11/8.
//

import Foundation
import UIKit

private let CellID = "CellID"

class BaseTableViewController:UIViewController {
    
    var titleView:NavTitleView = NavTitleView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: navHeight))
    
    let tableView:UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: ScreenH))
    
    let model:BaseTableViewModel = BaseTableViewModel()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        setupDefault()
        
        setupUI()
        
        getDate()
    }
    
    func setupDefault() {
        
        model.oy = Int((statusBarHeight).rounded())
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
//        tableView.contentInset = UIEdgeInsets(top: -statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellID)
        
        titleView.frame = CGRect(x: 0, y: 0, width: ScreenW, height: navHeight)
        
        view.addSubview(self.titleView)
        
        titleView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        changBarStyleWithStyle()
    }
    
    func changBarStyleWithStyle() {
        
        let nav:BaseNavigationController = self.navigationController as? BaseNavigationController ?? BaseNavigationController()
        
        nav.setBarStyleWithStyle(style: model.statusBarStyle)
    }
    
    func setupUI() {
        
        
    }
    
    func getDate() {
        
        
    }
    
    func scroDidWithPoint(oy:CGFloat) {
        
        
        
    }
    
    func changeStatusBarStyleWithStatus(status:Bool) {
        
        let barStatus = model.statusBarStyle
        
        switch barStatus {
            
        case .`default`:
            
            if status {
                
                model.statusBarStyle = .lightContent
                self.changBarStyleWithStyle()
            }
            
            break
        case .lightContent:
            if !status {
                
                model.statusBarStyle = .default
                self.changBarStyleWithStyle()
            }
            break
        case .darkContent:break
        @unknown default: break
            
        }
    }
    
}

extension BaseTableViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCell(withIdentifier: CellID) ?? UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: CellID)
    }
    
}

extension BaseTableViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
    
}

extension BaseTableViewController:NavTitleViewDelegate {
    
    func changTopWith(status: Bool) {
        
        self.changeStatusBarStyleWithStatus(status: status)
    }
    
    
    func setTableViewWith(top: CGFloat) {
        
        tableView.contentInset = UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
    }
    
    
    func didBackButton() {
        
        let count : Int = navigationController?.children.count ?? 0
        
        if(count > 1) {
                     
            navigationController?.popViewController(animated: true)
        }
    }
}

extension BaseTableViewController:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y  = Int((scrollView.contentOffset.y).rounded())
        
        if model.oy != y {
            
            model.oy = y
            
            self.titleView.getPointFromScroll(oy: CGFloat(y))
            
            let offset:CGPoint  = scrollView.contentOffset
            
            if (offset.y <= 0) {
                
                scroDidWithPoint(oy: offset.y)
            }
            
        }
        
    }
    
}


