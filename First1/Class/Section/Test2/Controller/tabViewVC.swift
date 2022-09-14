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
    
    let array: [Any] = [["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"伟哥","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"]]
    
    var titleText = UILabel()
    
    var modelArray:[Any]!{
        
        didSet {
            
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        
        setupUI()
        setupNav()
        
        let jsonString:String = JsonUtil.getJSONStringFromArray(array:array)
        
        modelArray = JsonUtil.jsonArrayToModel(jsonString, ListModel.self) as! [ListModel]
        
    }
    
    
    //setupUI
    func setupUI () {
        
        tableView.register(ListCell.self, forCellReuseIdentifier: listCellID)
    }
    
    //setupNav
    func setupNav() {
        
        titleText.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        titleText.text = "消息"
        titleText.sizeToFit()
        navigationItem.titleView = titleText
    }
    
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return modelArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: listCellID, for: indexPath) as! ListCell
        
        cell.model = modelArray[indexPath.row] as? ListModel
        
        return cell
    }
    
    //UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = modelArray[indexPath.row] as? ListModel
        
        return model?.height ?? 10
    }
    
    
}

