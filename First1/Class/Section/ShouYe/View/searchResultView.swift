//
//  searchResultView.swift
//  First1
//
//  Created by New on 2022/11/24.
//

import Foundation
import UIKit

private let NormalCityCellID = "NormalCityCell"

@objc protocol searchResultViewDelegate : NSObjectProtocol {
    
    @objc optional func didBeginScroll()  -> Void
    @objc optional func didSelectCity(city:String)  -> Void
}

class searchResultView:UIView {
    
    weak var zDelegate : (searchResultViewDelegate)?
    
    var tipView:BaseTipView = BaseTipView()
    
    var tableView:UITableView = UITableView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.register(NormalCityCell.self, forCellReuseIdentifier: NormalCityCellID)
        tableView.dataSource = self
        tableView.delegate = self
        addSubview(tableView)
        
        tipView.isHidden = true
        addSubview(tipView)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        tableView.frame = self.bounds
        
        tipView.frame = self.bounds
    }
    
    var resultArray:[String]? = []
    
    public func setupWithArray(array:[String]) {
        
        resultArray = array
        
        if array.count == 0 {
            
            tipView.isHidden = false
        }else {
            
            tipView.isHidden = true
        }
        
        tableView.reloadData()
    }

}

extension searchResultView:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NormalCityCellID) as! NormalCityCell
        
        let text:String = resultArray?[indexPath.row] ?? ""
        
        cell.content = text
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        zDelegate?.didSelectCity?(city: resultArray?[indexPath.row] ?? "")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        zDelegate?.didBeginScroll?()
    }
    
}
