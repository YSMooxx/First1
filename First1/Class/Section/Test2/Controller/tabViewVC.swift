//
//  tabViewVC.swift
//  First1
//
//  Created by New on 2022/9/11.
//

import Foundation
import UIKit

private let listCellID = "listCellID"

class tabViewVC:BaseTableViewController {
    
    let array: [Any] = [["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"伟哥","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"]]
    
    var titleText = UILabel()
    
    var modelArray:[Any]!{
        
        didSet {
            
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let jsonString:String = JsonUtil.getJSONStringFromArray(array:array)
        
        modelArray = JsonUtil.jsonArrayToModel(jsonString, ListModel.self) as! [ListModel]
        
    }
    
    
    //setupUI
    override func setupUI () {
        
        tableView.register(ListCell.self, forCellReuseIdentifier: listCellID)
    }
    
    //setupNav
    override func setupNav() {
        
        title = "消息"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        navigationController?.navigationBar.setBackgroundImage(UIImage.init(named: "back"), for: UIBarMetrics.default)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc : MVVM2Controller = MVVM2Controller.init()
        
        vc.title = "MVVM2"
        
    }
    
    
}

