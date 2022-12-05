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
    
    func setDefault() {
        
        titleView.delegate = self
        view.addSubview(titleView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellID)
        tableView.contentInset = UIEdgeInsets(top: -statusBarHeight, left: 0, bottom: 0, right: 0)
        view.insertSubview(tableView, at: 0)
    }
    
    func setupUI() {
        
        
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()

    }
    
    
    
}

extension BaseSearchViewController {
    
    func changBarStyleWithStyle() {
        
        let nav:BaseNavigationController = self.navigationController as? BaseNavigationController ?? BaseNavigationController()
        
        nav.setBarStyleWithStyle(style: model.statusBarStyle)
    }
}

extension BaseSearchViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)
        
        cell.backgroundColor = UIColor.colorWithHex(hexStr: "#FEBA07")
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
    }
    
}

extension BaseSearchViewController:SearchTitleDelegate {
    
    func leftButtonClick() {
        
        
    }
    
    func rightButtonClick() {
        
        
    }
    
    func textFieldDidBeginEditing() {
        
        
    }
}
