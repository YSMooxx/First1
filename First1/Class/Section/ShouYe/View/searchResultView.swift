//
//  searchResultView.swift
//  First1
//
//  Created by New on 2022/11/24.
//

import Foundation
import UIKit

private let cellID = "cell"

class searchResultView:UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
    
        super.init(frame: frame, style: style)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.dataSource = self
        self.delegate = self
    }

}

extension searchResultView:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)!
        
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}
