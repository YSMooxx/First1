//
//  tabViewVC.swift
//  First1
//
//  Created by New on 2022/9/11.
//

import Foundation
import UIKit

private let listCellID = "listCellID"

class tabViewVC:UITableViewController {
    
    let array:NSArray = ["1","2","4","6","3","5","8"]
    
    var titleText = UILabel()
    
    override func viewDidLoad() {
        
        setupUI()
        setupNav()
    }
    
    //setupUI
    func setupUI () {
        
        tableView.backgroundColor = UIColor.colorWithHex(hexStr: "#DAA45A")
        tableView.register(ListCell.self, forCellReuseIdentifier: listCellID)
    }
    
    func setupNav() {
        
        titleText.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        titleText.text = "tablview"
        titleText.textColor = UIColor.white
        navigationItem.titleView = titleText
    }
    
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: listCellID, for: indexPath) as! ListCell
        
        let model:ListModel = ListModel.init(name: "嘻嘻哈哈", icon: "123")
        
        cell.model = model
        
        cell.contentView.backgroundColor = UIColor.colorWithHex(hexStr: "#EED71A")
        
        return cell
    }
    
    //UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
    
    
}

