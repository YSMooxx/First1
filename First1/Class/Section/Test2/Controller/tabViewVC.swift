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
    
    let subVC:MVVM2Controller = MVVM2Controller()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    //setupUI
    override func setupUI () {
        
        model.statusBarStyle = .lightContent
        
        let sModel:NavTitleModel = titleView.model ?? NavTitleModel()
        sModel.title = "业务"
        sModel.titleColor = "#FFFFFF"
        sModel.backColor = "#C06F98"
        
        titleView.model = sModel
        
        tableView.register(ListCell.self, forCellReuseIdentifier: listCellID)
        tableView.showsVerticalScrollIndicator = false
        
    }
    
    override func getDate() {
        
        let array:[Any] = [["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"伟哥","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"伟哥","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"伟哥","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"伟哥","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"伟哥","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"伟哥","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"]]
        
        model.jsonZhuanModelWithTypel(ListModel.self, jsonArray1: array) {
            
            tableView.reloadData()
        }
        
    }
    
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.subModelArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: listCellID, for: indexPath) as! ListCell
        
        let sModel:ListModel = model.subModelArray[indexPath.row] as! ListModel
        
        cell.model = sModel
        
        return cell
    }
    
    //UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = model.subModelArray[indexPath.row] as? ListModel
        
        return model?.height ?? 10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        subVC.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(subVC, animated: true)
    }
    
    
}

