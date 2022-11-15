//
//  BaseCollectionViewController.swift
//  First1
//
//  Created by New on 2022/11/12.
//

import Foundation
import UIKit

private let collectionViewCellID = "collectionViewCellID"

class BaseCollectionViewController:UIViewController, WaterFallLayoutDelegate {
    
    func waterFlowLayoutSection() -> Int {
        
        return 1
    }
    
    func waterFlowLayout(_ waterFlowLayout: WaterFallFlowLayout, itemHeight indexPath: IndexPath) -> CGFloat {
        
        return 0 
    }
    
    var titleView:NavTitleView = NavTitleView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: navHeight))
    
    var collectionView:UICollectionView! = nil
    
    let model:BaseTableViewModel = BaseTableViewModel()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        setupDefault()
        
        setupUI()
        
        getDate()
    }
    
    func setupDefault() {
        
        view.backgroundColor = .white
        
        let layout = WaterFallFlowLayout()
        layout.delegate = self

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: -statusBarHeight, left: 0, bottom: 0, right: 0)
        view.addSubview(collectionView)
        // 注册 Cell
        
        titleView.frame = CGRect(x: 0, y: 0, width: ScreenW, height: navHeight)
        view.addSubview(self.titleView)
        titleView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        changBarStyleWithStyle()
    }
    
    func changBarStyleWithStyle() {
        
        let nav:BaseNavigationController = self.navigationController as? BaseNavigationController ?? BaseNavigationController()
        
        nav.setBarStyleWithStyle(style: model.statusBarStyle)
    }
    
    func setupUI() {
        
        
    }
    
    func getDate() {
        
        
    }
}

extension BaseCollectionViewController:UICollectionViewDelegate {
    
    
    
}

extension BaseCollectionViewController:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellID, for: indexPath)
    }
    
}

extension BaseCollectionViewController:UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 0, height: 0)
    }
}


extension BaseCollectionViewController:NavTitleViewDelegate {
    
    func didBackButton() {
        
        let count : Int = navigationController?.children.count ?? 0
        
        if(count > 1) {
                     
            navigationController?.popViewController(animated: true)
        }
    }
    
    func setTableViewWith(top: CGFloat) {
        
        collectionView.contentInset = UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
    }
    
    func changTopWith(status: Bool) {
        
        
    }
    
}
