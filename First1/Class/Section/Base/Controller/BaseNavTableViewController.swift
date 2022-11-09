//
//  BaseNavTableViewController.swift
//  First1
//
//  Created by New on 2022/11/8.
//

import Foundation
import UIKit

private let CellID = "CellID"

class BaseNavTableViewController:BaseTableViewController {
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
    }
    
    override func setupUI() {
        
        self.tableView.backgroundColor = UIColor.blue
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let sectionHeaderHeight:CGFloat = navHeight
        
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            
            scrollView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            
            scrollView.contentInset = UIEdgeInsets(top: -sectionHeaderHeight, left: 0, bottom: 0, right: 0)
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return navHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: ScreenW, height: navHeight))
        
        view.backgroundColor = mColor
        
        return view
    }
    
}
