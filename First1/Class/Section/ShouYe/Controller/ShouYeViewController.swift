//
//  ShouYeViewController.swift
//  First1
//
//  Created by New on 2022/12/2.
//

import Foundation

class ShouYeViewController:BaseSearchViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
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
    }
    
    
    
}
//UITableViewDelegate,UITableViewDataSource
extension ShouYeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
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


