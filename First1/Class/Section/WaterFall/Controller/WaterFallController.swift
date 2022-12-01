//
//  ViewController.swift
//  waterfallMultiSection
//
//  Created by drogan Zheng on 2020/5/11.
//  Copyright © 2020 drogan Zheng. All rights reserved.
//

import UIKit
import MJRefresh

class WaterFallController: UIViewController {
    
    var titleView:NavTitleView = NavTitleView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: navHeight))
    
    var collectionView:UICollectionView! = nil
    
    var model:BaseCollectionModel = BaseCollectionModel()
  
    override func viewDidLoad() {
    
        super.viewDidLoad()
        setupParamter()
        setupUI()
        layoutPageSubviews()
        settabbarNum()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let time = Date.init().timeIntervalSince1970 * 1000
        
        if Int(time) > UserDef.shard.locationTime + 10000 {
            
            LocationManager.shared.startRequestLocation()
            LocationManager.shared.callBack = {[weak self] (city) in
                
                let sCity = city.getCityNameRemoveLast()
                
                if self?.model.loactionCount == 0 {
                    
                    self?.titleView.setletfContetn(text:sCity)
                }
                
                self?.model.loactionCount = (self?.model.loactionCount ?? 0) + 1
                
                UserDef.shard.dCity = sCity
                UserDef.saveUserDefToSandBox()
                HUDManager.shouTextWithString(text: sCity)
                HUDManager.dismissWithDelay(time: 2)
            }
            
        }
        
    }
    
    func settabbarNum() {
        
        let badgePoint = CGPoint(x: 19, y: -4)
        self.tabBarController?.tabBar.badgePoint = badgePoint
        self.tabBarController?.tabBar.badgeSize = CGSize(width: 20, height: 20)
        self.tabBarController?.tabBar.badgeColor = UIColor.colorWithHex(hexStr: "#FF0033")
        self.tabBarController?.tabBar.badgeValue = "99+"
        self.tabBarController?.tabBar.showBadgeOnItemIndex(index: 0)
        self.tabBarController?.tabBar.setNumOnIndexWithString(index: 0, text: "1")
    }
  
  // MARK: - ====== View Initialization 初始化界面 ======
  // MARK: - ====== UI初始化 ======
    fileprivate func setupUI() {
        
        let layout = WaterfallMutiSectionFlowLayout()
        layout.delegate = self
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(testCell.self, forCellWithReuseIdentifier: testCell.identifiers)
        collectionView.register(testHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: testHeaderView.header)
        collectionView.register(testHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: testHeaderView.footer)
        view.addSubview(collectionView)
        
        titleView.frame = CGRect(x: 0, y: 0, width: ScreenW, height: navHeight)
        view.addSubview(self.titleView)
        titleView.delegate = self
        let titleModel = NavTitleModel()
        titleModel.vcCount = 2
        titleModel.backImage = "map"
        titleModel.btnSize = CGSize(width: 18, height: 18)
        titleView.model = titleModel
        titleView.setletfContetn(text: UserDef.shard.dCity ?? "")
        
        let header:MJRefreshNormalHeader = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(refresh))
        
        header.lastUpdatedTimeLabel?.isHidden = true
        
        collectionView.mj_header = header
        
    }
    
    @objc func refresh() {
        
        self.collectionView.mj_header?.beginRefreshing()
        
        collectionView.reloadData()
        
        self.collectionView.mj_header?.endRefreshing()
    }
  
  // MARK: - ====== 初始化布局 ======
  fileprivate func layoutPageSubviews() {
    
  }
  
  // MARK: - ====== 初始化参数 ======
  fileprivate func setupParamter() {
    
  }
  
  // MARK: - ====== 公共方法 ======
  
  
  // MARK: - ====== 私有方法 ======
  
  private func sectionName(section: Int) -> String {
    switch section {
    case 0:
      return "瀑布流布局"
    case 1:
      return "线性列表布局"
    case 2:
      return "九宫格布局"
    default:
      return ""
    }
  }
  
  // MARK: - ====== 子控件管理 ======
  
  
  // MARK: - ====== 网络请求 ======
  
  
  // MARK: - ====== 懒加载 ======
  
  
  // MARK: - ====== 测试代码 ======
  
  
}

extension WaterFallController:NavTitleViewDelegate {
    
    func setTableViewWith(top: CGFloat) {
        
        collectionView.contentInset = UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
    }
    
    func didBackButton() {
        
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
}

// MARK: - ====== 代理实现 ======

extension WaterFallController: UICollectionViewDelegate, UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch section {
        // 瀑布流
    case 0:
      return 18
        // 线性
    case 1:
      return 3
        // 九宫格
    default:
      return 9
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: testCell.identifiers, for: indexPath) as! testCell
    cell.testLab.text = " \(indexPath.section) section \(indexPath.row) item"
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: testHeaderView.header, for: indexPath) as! testHeaderView
      header.testLab.text = "\(sectionName(section: indexPath.section)) header view"
      header.backgroundColor = .purple
      return header
    } else if kind == UICollectionView.elementKindSectionFooter {
      let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: testHeaderView.footer, for: indexPath) as! testHeaderView
      footer.testLab.text = "\(sectionName(section: indexPath.section)) footer view"
      footer.backgroundColor = .systemBlue
      return footer
    }
    return UICollectionReusableView()
  }
  
}

extension WaterFallController: WaterfallMutiSectionDelegate {
  func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
    switch indexPath.section {
    case 0:
      return CGFloat((arc4random() % 3 + 1) * 30)
    case 1:
      return 135
    default:
      return 80
    }
  }
  
  func columnNumber(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> Int {
    switch section {
    case 0:
      return 2
    case 1:
      return 1
    default:
      return 3
    }
  }
  
  func referenceSizeForHeader(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize {
    return CGSize(width: self.view.frame.size.width, height: 0)
  }
  
  func referenceSizeForFooter(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize {
    return CGSize(width: self.view.frame.size.width, height: 0)
  }
  
  func insetForSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  
  func lineSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
    return 5
  }
  
  func interitemSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
    return 5
  }
  
  func spacingWithLastSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
    return 5
  }
}

class testCell: UICollectionViewCell {
  static let identifiers = "testcellssss"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configBaseView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configBaseView() {
    backgroundColor = .darkGray
    addSubview(testLab)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    testLab.frame = self.bounds
  }
  
  lazy var testLab: UILabel = {
    let tmp = UILabel()
    tmp.textColor = .white
    tmp.font = .systemFont(ofSize: 14)
    tmp.textAlignment = .center
    tmp.numberOfLines = 0
    return tmp
  }()
}

class testHeaderView: UICollectionReusableView {
  static let header = "testHeaderViewId"
  static let footer = "testFooterViewId"
  override init(frame: CGRect) {
    super.init(frame: frame)
    configBaseView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configBaseView() {
    addSubview(testLab)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    testLab.frame = bounds
  }
  
  lazy var testLab: UILabel = {
    let tmp = UILabel()
    tmp.textColor = .white
    tmp.font = .systemFont(ofSize: 14)
    tmp.textAlignment = .center
    tmp.numberOfLines = 0
    return tmp
  }()
}


