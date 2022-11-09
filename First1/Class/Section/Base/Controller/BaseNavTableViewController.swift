//
//  BaseNavTableViewController.swift
//  First1
//
//  Created by New on 2022/11/8.
//

import Foundation
import UIKit

private let CellID = "CellID"

class BaseNavTableViewController:UIViewController, UITableViewDelegate {
    
    let titleView:NavTitleView = NavTitleView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: navHeight))
    
    let tableView:UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: ScreenH))
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        setupUI()
        
        setupDefault()
        
        getDate()
    }
    
    func setupDefault() {
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        titleView.frame = CGRect(x: 0, y: 0, width: ScreenW, height: navHeight)
        
        view.addSubview(self.titleView)
        
        titleView.delegate = self
    }
    
    func setupUI() {
        
        
    }
    
    func getDate() {
        
        
    }
    
}

extension BaseNavTableViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCell(withIdentifier: CellID) ?? UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: CellID)
    }
    
}

extension BaseNavigationController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
    
}

extension BaseNavTableViewController:NavTitleViewDelegate {
    
    func didBackButton() {
        
        let count : Int = navigationController?.children.count ?? 0
        
        if(count > 1) {
            
            navigationController?.popViewController(animated: true)
        }
    }
}


