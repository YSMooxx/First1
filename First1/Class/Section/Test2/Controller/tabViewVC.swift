//
//  tabViewVC.swift
//  First1
//
//  Created by New on 2022/9/11.
//

import Foundation
import UIKit
import MJRefresh

private let listCellID = "listCellID"

class tabViewVC:BaseTableViewController {
    
//    let subVC:MVVM2Controller = MVVM2Controller()
    
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
        
        
        let header = MJRefreshGifHeader.init(refreshingTarget: self, refreshingAction:#selector(getData2))
        
        header.lastUpdatedTimeLabel?.isHidden = true  // 隐藏时间
        header.stateLabel?.textColor = .white
        header.isAutomaticallyChangeAlpha = true
        
        var imageArray:[Any] = []
        
        for i in 1...12 {
            
            let string = "loading\(i)"
            
            let image = UIImage(named: string)
            
            imageArray.append(image ?? UIImage())
        }
        // 设置普通状态的动画图片
        
        header.setImages(imageArray, for: .refreshing)
        header.setImages(imageArray, for: .pulling)

        tableView.mj_header = header
        
        let imageView:UIImageView = UIImageView(image: UIImage(named: "titleimage3"))
        
        imageView.frame = CGRect(x: 0, y: -298, width: ScreenW, height: 342)
        
        tableView.mj_header?.insertSubview(imageView, at: 0)
        
    }
    
    @objc func getData2() {
        
        self.tableView.mj_header?.beginRefreshing()
        
        let array:[Any] = [["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"]]
        
        model.jsonZhuanModelWithTypel(ListModel.self, jsonArray1: array)
        
        tableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        
            self.tableView.mj_header?.endRefreshing()
        }
        
    }
    
    func getData3() {
        
        let array:[Any] = [["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"]]
        
        model.jsonAddModelWithTypel(ListModel.self, jsonArray1: array)
        
        tableView.reloadData()
    }
    
    override func getDate() {
        
        let array:[Any] = [["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6"],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F"],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6"],["name":"李原灯","height":64,"icon":"nanIcon","explain":"在哪里","color":"#2775B6"]]
        
        model.jsonZhuanModelWithTypel(ListModel.self, jsonArray1: array)
        
        tableView.reloadData()
        
    }
    
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.sModelArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: listCellID, for: indexPath) as! ListCell
        
        let sModel:ListModel = model.sModelArray[indexPath.row] as! ListModel
        
        cell.model = sModel
        
        return cell
    }
    
    //UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = model.sModelArray[indexPath.row] as? ListModel
        
        return model?.height ?? 10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc:MVVM2Controller = MVVM2Controller()
        
        vc.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

