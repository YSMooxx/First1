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
        
        //titleView.model
        titleView.model.leftBtnSize = CGSize(width: 20, height: 20)
        titleView.model.leftImage = "map"
        titleView.model.leftText = UserDef.shard.dCity ?? "同城"
        titleView.model.rightImage = "notification"
        titleView.model.backColor = "#FFFFFF"
        titleView.searchTitlViewRefreshView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y = scrollView.contentOffset.y
        
        if y <= 0 {
            
            if model.navStatus == .scollHalfNavHeightUp {
                
                titleView.titleViewBackClear()
            }
            
            model.navStatus = .scollOutNavHeightUp
            
        }else if y > 0 && y <= navHeight / 2 {
            
            if model.navStatus == .scollHalfNavHeightDown {
                
                model.statusBarStyle = .lightContent
                changBarStyleWithStyle()
                titleView.titleViewChangSubViewColor(changde: false)
            }
            
            titleView.titleViewChangBackAlphaWithPoint(point: scrollView.contentOffset)
            model.navStatus = .scollHalfNavHeightUp
            
        }else if y > navHeight / 2 &&  y <= navHeight{
            
            if model.navStatus == .scollHalfNavHeightUp {
                
                model.statusBarStyle = .default
                changBarStyleWithStyle()
                titleView.titleViewChangSubViewColor(changde: true)
            }
            
            titleView.titleViewChangBackAlphaWithPoint(point: scrollView.contentOffset)
            model.navStatus = .scollHalfNavHeightDown
        }else if y > navHeight{
            
            if model.navStatus == .scollHalfNavHeightDown {
                
                titleView.titleViewChangBackAlphaWithPoint(point: scrollView.contentOffset)
            }
            
            model.navStatus = .scollOutNavHeightDown
        }
        
    }
    
}

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
        present(nav, animated: false)
    }
}


