//
//  ShouYeViewController.swift
//  First1
//
//  Created by New on 2022/12/2.
//

import Foundation
import MJRefresh

private let ShouyeLunboqiCellID = "ShouyeLunboqiCell"
private let ShouyeSelectMenuCellID = "ShouyeSelectMenuCell"

private let CellID = "Cell"

class ShouYeViewController:BaseSearchViewController {
    
    var titleCell:ShouyeLunboqiCell?
    
    override func viewDidLoad() {
        
        setupModel()
        setupUI()
        setDefault()
    }

    override func setupUI() {
        
        view.backgroundColor = UIColor.colorWithHex(hexStr: "#FEBA07")
        
        //titleView
        titleView.model.leftBtnSize = CGSize(width: 20, height: 20)
        titleView.model.leftImage = "map"
        titleView.model.leftText = UserDef.shard.dCity ?? "同城"
        titleView.model.rightImage = "notification"
        titleView.model.backColor = "#FFFFFF"
        titleView.searchTitlViewRefreshView()
        
        //tableView
        tableView.register(ShouyeLunboqiCell.self, forCellReuseIdentifier: ShouyeLunboqiCellID)
        tableView.register(ShouyeSelectMenuCell.self, forCellReuseIdentifier: ShouyeSelectMenuCellID)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellID)
        let header:MJRefreshNormalHeader = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(refresh))
        header.lastUpdatedTimeLabel?.isHidden = true
        let backView:UIView = UIView(frame: CGRect(x: 0, y: -ScreenH + header.height, width: ScreenW, height: ScreenH ))
        backView.backgroundColor = UIColor.colorWithHex(hexStr: "#CCCCCC")
        tableView.mj_header = header
        tableView.mj_header?.insertSubview(backView, at: 0)
    }
    
    
    func setupModel() {
        
        let lunboqiModel:ShouyeLunboqiModel = ShouyeLunboqiModel()
        model.subModelArray.append(lunboqiModel)
        
        let selectMenuModel:ShouyeSelectMenuCellModel = ShouyeSelectMenuCellModel()
        model.subModelArray.append(selectMenuModel)
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        titleCell?.addTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        titleCell?.removeTimer()
        UIImageView.clearMemory()
    }
    
    @objc func refresh() {
        
        self.tableView.mj_header?.beginRefreshing()
        
        tableView.reloadData()
        
        self.tableView.mj_header?.endRefreshing()
    }
    
}
//UITableViewDelegate,UITableViewDataSource
extension ShouYeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if model.subModelArray.count == 0 {
            
            return 0
        }else {
            
            return 20
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        switch row{
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: ShouyeLunboqiCellID, for: indexPath) as! ShouyeLunboqiCell
            
            cell.callBack = { (model) in
                
                print((model.imageUrl))
            }
            
            titleCell = cell
            
            return cell
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: ShouyeSelectMenuCellID, for: indexPath) as! ShouyeSelectMenuCell
            
            return cell
            
        default:
        
            let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) 
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if model.subModelArray.count == 0 {
            
            return 44
        }else {
            
            if indexPath.row == 0 {
                
                return ScreenW  / 1.7
            }else if indexPath.row == 1 {
                
                let selectMenuModel:ShouyeSelectMenuCellModel = model.subModelArray[1] as! ShouyeSelectMenuCellModel
                
                return selectMenuModel.subModel.height
            }else {
                
                return 44
            }
        }
        
    }
    
}

//SearchTitleDelegate
extension ShouYeViewController {
    
    override func leftButtonClick() {
        
        let vc = CityViewController()
        
        vc.callBack = {[weak self] (city) in
            
            UserDef.shard.xCity = city
            UserDef.saveUserDefToSandBox()
            self?.titleView.setletfContetn(text: city)
            self?.model.loactionCount = (self?.model.loactionCount ?? 0) + 1
        }
        
        let nav = BaseNavigationController(rootViewController: vc)
        definesPresentationContext = true
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    override func textFieldDidBeginEditing() {
        
        
    }
    
    override func rightButtonClick() {
        
        
    }
}



