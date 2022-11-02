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

class MVVM2Controller:BaseTableViewController{
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    var array:NSMutableArray = NSMutableArray.init()
    
    let array2: [Any] = [["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6","sex":1],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F","sex":0],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6","sex":0],["name":"伟哥","height":80,"icon":"nanIcon","explain":"在哪里","color":"#2775B6","sex":1],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6","sex":1],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F","sex":0],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6","sex":0],["name":"伟哥","height":80,"icon":"nanIcon","explain":"在哪里","color":"#2775B6","sex":1],["name":"非常想你","height":64,"icon":"nanIcon","explain":"[捂脸][捂脸][捂脸]","color":"#2775B6","sex":1],["name":"四川一家人","height":64,"icon":"nvIcon","explain":"非常想你：厉害了","color":"#EA517F","sex":0],["name":"张俊杰","height":64,"icon":"nanIcon","explain":"好的好的","color":"#2775B6","sex":0],["name":"伟哥","height":80,"icon":"nanIcon","explain":"在哪里","color":"#2775B6","sex":1]]
    
    override func setupUI() {
        
        tableView.register(MVVM2ListCell1.self, forCellReuseIdentifier: MVVM2ListCell1ID)
        tableView.register(MVVM2ListCell2.self, forCellReuseIdentifier: MVVM2ListCell2ID)
    }
    
    override func setupNav() {
        
        self.navigationController?.setValue("MVVM", forKeyPath: "titleText.text")
    }
    
    override func getdate() {
        
        let jsonString:String = JsonUtil.getJSONStringFromArray(array:array2)
        
        let array3:[Any] = JsonUtil.jsonArrayToModel(jsonString, MVVM2Model.self) as! [MVVM2Model]
        
        for Model in array3 {
            let VM:MVVM2ViewModel = MVVM2ViewModel.init()
            VM.model = Model as? MVVM2Model
            array.add(VM)
        }
        
        tableView.reloadData()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let VM:MVVM2ViewModel = array[indexPath.row] as! MVVM2ViewModel
        
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
            }

        }
    
    
    //UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let VM:MVVM2ViewModel = array[indexPath.row] as! MVVM2ViewModel
        
        return VM.model?.height ?? 10
    }
    
}
