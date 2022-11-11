//
//  MVVM2Controller.swift
//  First1
//
//  Created by New on 2022/11/2.
//

import Foundation
import UIKit

private let MVVM2ListCell1ID = "MVVM2ListCell1"
private let MVVM2ListCell2ID = "MVVM2ListCell2"
private let ImageViewCellID = "ImageViewCell"

class MVVM2Controller:BaseTableViewController{
    
    var titleimageCell:ImageViewCell = ImageViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: ImageViewCellID)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func setupUI() {
        
        tableView.register(MVVM2ListCell1.self, forCellReuseIdentifier: MVVM2ListCell1ID)
        tableView.register(MVVM2ListCell2.self, forCellReuseIdentifier: MVVM2ListCell2ID)
        tableView.register(ImageViewCell.self, forCellReuseIdentifier: ImageViewCellID)
        tableView.showsVerticalScrollIndicator = false
        
        model.statusBarStyle = .lightContent
        
        let titleMode:NavTitleModel = titleView.model ?? NavTitleModel()
        titleMode.title = "我的"
        titleMode.titleColor = "#000000"
        titleMode.backColor = "#F8F8F8"
        titleMode.aplha = 0
        titleMode.viewHideen = true
        titleMode.backBtnHidden = true
        titleMode.style = .ScrollShow
        titleMode.vcCount = navigationController?.children.count ?? 1
        titleMode.backImage = "back"
        titleView.model = titleMode
    }
    
    override func getDate() {
        
        let array:[Any] = [["name":"非常想你","height":64,"icon":"titleimage3","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6","sex":2],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F","sex":0],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6","sex":0],["name":"伟哥","height":80,"icon":"nanIcon","explain":"在哪里","color":"#2775B6","sex":1],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6","sex":1],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F","sex":0],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6","sex":0],["name":"伟哥","height":80,"icon":"nanIcon","explain":"在哪里","color":"#2775B6","sex":1],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6","sex":1],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F","sex":0],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6","sex":0],["name":"伟哥","height":80,"icon":"nanIcon","explain":"在哪里","color":"#2775B6","sex":1]]
        
        model.jsonZhuanModelWithTypel(MVVM2Model.self, jsonArray1: array) {
            
            for sModel in model.subModelArray {
                
                let VM:MVVM2ViewModel = MVVM2ViewModel.init()
                VM.model = sModel as? MVVM2Model
                model.subModelArray2.add(VM)
            }
            
            tableView.reloadData()
        }

    }
    
    override func scroDidWithPoint(oy: CGFloat) {
    
        titleimageCell.changeWithPoint(y: oy)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return model.subModelArray2.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let VM:MVVM2ViewModel = model.subModelArray2[indexPath.row] as! MVVM2ViewModel
        
        VM.index = indexPath
        
        let sex = VM.sex
        
        switch sex{
        case .nan :
            let cell1 = tableView.dequeueReusableCell(withIdentifier: MVVM2ListCell1ID, for: indexPath) as! MVVM2ListCell1
            cell1.vModel = VM
            return cell1
            
        case .nv :
            let cell2 = tableView.dequeueReusableCell(withIdentifier: MVVM2ListCell2ID, for: indexPath) as! MVVM2ListCell2
            cell2.vModel = VM
            return cell2
        case .nn:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: ImageViewCellID, for: indexPath) as! ImageViewCell
            cell3.vModel = VM
            titleView.model.imageHeight = VM.height
            titleimageCell = cell3
            return cell3
        }
    }
    
    //UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let VM:MVVM2ViewModel = model.subModelArray2[indexPath.row] as! MVVM2ViewModel
        
        return VM.model?.height ?? 10
    }
    
}
