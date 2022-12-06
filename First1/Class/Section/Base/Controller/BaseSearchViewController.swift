//
//  BaseSearchViewController.swift
//  First1
//
//  Created by New on 2022/12/2.
//

import Foundation

private let CellID = "Cell"

class BaseSearchViewController:UIViewController {
    
    lazy var titleView:BaseSearchTitleView = BaseSearchTitleView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: navHeight))
    
    let tableView:UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: ScreenH - navHeight))
    
    lazy var model:BaseSearchModel = BaseSearchModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setDefault()
        setupUI()
    }
    
    //默认初始化
    func setDefault() {
        
        titleView.delegate = self
        view.addSubview(titleView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellID)
        tableView.contentInset = UIEdgeInsets(top: -statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.showsVerticalScrollIndicator = false
        view.insertSubview(tableView, at: 0)
    }
    
    //子类初始化
    func setupUI() {
        
        
    }
    
}

//补充方法
extension BaseSearchViewController {
    
    //改变状态栏颜色
    func changBarStyleWithStyle() {
        
        let nav:BaseNavigationController = self.navigationController as? BaseNavigationController ?? BaseNavigationController()
        
        nav.setBarStyleWithStyle(style: model.statusBarStyle)
    }
}

//tableView代理、数据源
extension BaseSearchViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)
        
        cell.backgroundColor = UIColor.colorWithHex(hexStr: "#FEBA07")
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y = scrollView.contentOffset.y
        
        if y <= 0 {
            
            if model.navStatus == .scollHalfNavHeightUp {
                
                titleView.titleViewBackClear()
            }
            
            if model.navStatus != .scollOutNavHeightUp {
                
                model.navStatus = .scollOutNavHeightUp
            }
            
        }else if y > 0 && y <= navHeight / 2 {
            
            if model.navStatus == .scollHalfNavHeightDown {
                
                model.statusBarStyle = .lightContent
                changBarStyleWithStyle()
                titleView.titleViewChangSubViewColor(changde: false)
            }
            
            titleView.titleViewChangBackAlphaWithPoint(point: scrollView.contentOffset)
            
            if model.navStatus != .scollHalfNavHeightUp {
                
                model.navStatus = .scollHalfNavHeightUp
            }
            
        }else if y > navHeight / 2 &&  y <= navHeight{
            
            if model.navStatus == .scollHalfNavHeightUp {
                
                model.statusBarStyle = .default
                changBarStyleWithStyle()
                titleView.titleViewChangSubViewColor(changde: true)
            }
            
            titleView.titleViewChangBackAlphaWithPoint(point: scrollView.contentOffset)
            
            if model.navStatus != .scollHalfNavHeightDown {
                
                model.navStatus = .scollHalfNavHeightDown
            }
            
        }else if y > navHeight{
            
            if model.navStatus == .scollHalfNavHeightDown {
                
                titleView.titleViewChangBackAlphaWithPoint(point: scrollView.contentOffset)
            }
            
            if model.navStatus != .scollOutNavHeightDown {
                
                model.navStatus = .scollOutNavHeightDown
            }
            
        }
    }
    
}

//头部代理方法
extension BaseSearchViewController:SearchTitleDelegate {
    
    func leftButtonClick() {
        
        
    }
    
    func rightButtonClick() {
        
        
    }
    
    func textFieldDidBeginEditing() {
        
        
    }
}
