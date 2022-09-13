//
//  ListCell.swift
//  First1
//
//  Created by New on 2022/9/12.
//

import Foundation
import UIKit

class ListCell:UITableViewCell {
    
    var label:UILabel = UILabel.init()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        addView()
    }
    
    //setupUI
    func setupUI() {
        
        selectionStyle = UITableViewCell.SelectionStyle.none
        contentView.backgroundColor = UIColor.colorWithHex(hexStr: "#EED71A")
    }
    
    //addView
    func addView() {
        
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.colorWithHex(hexStr: "#EA517F")
        
        contentView.addSubview(label)
    }
    
    override func layoutSubviews() {
        
        label.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    var model:ListModel? {
        
        didSet {
            
//            textLabel?.text = model?.name
            label.text = model?.name
            label.sizeToFit()
        }
    }
    
    
    
}
