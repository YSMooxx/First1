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
    
    let array: [Any] = [["name":"user1","height":64,"icon":"tabbar_bill_normal","explain":"这是一个人"],["name":"user2","height":100,"icon":"tabbar_bill_selected","explain":"这是不是个人"],["name":"user3","height":200,"icon":"tabbar_bill_selected","explain":"这是不是个人"],["name1":"user4","height":200,"icon":"tabbar_bill_selected","explain":"这是不是个人"]]
    
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
        
        tableView.backgroundColor = UIColor.colorWithHex(hexStr: "#DAA45A")
        tableView.register(ListCell.self, forCellReuseIdentifier: listCellID)
    }
    
    //setupNav
    func setupNav() {
        
        titleText.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        titleText.text = "tablview"
        titleText.sizeToFit()
        titleText.textColor = UIColor.white
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

