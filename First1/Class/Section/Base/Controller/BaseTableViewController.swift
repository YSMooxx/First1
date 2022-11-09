//
//  BaseTableViewController.swift
//  First1
//
//  Created by New on 2022/11/2.
//

import UIKit

private let Cell1ID = "CellID"

class BaseTableViewController:UITableViewController{
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        setupDefault()
        
        setupUI()
        
        getDate()
    }
    
    func setupDefault() {
        
        view.backgroundColor = .white
        
    }
    
    func setupUI() {
        
        
    }
    
    func getDate() {
        
        
    }


}
