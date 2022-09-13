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
    var label1:UILabel = UILabel.init()
    var line:UIView = UIView.init()
    
    
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
        
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.colorWithHex(hexStr: "#EA517F")
        
        label1.font = UIFont.systemFont(ofSize: 16)
        label1.textColor = UIColor.colorWithHex(hexStr: "#000000")
        
        line.backgroundColor = UIColor.gray
        
    }
    
    //addView
    func addView() {
        
        contentView.addSubview(label)
        contentView.addSubview(label1)
        contentView.addSubview(line)
    }
    
    override func layoutSubviews() {
        
        label.snp.makeConstraints { make in
            
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        label1.snp.makeConstraints { make in
            
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        line.snp.makeConstraints { make in
            
            make.width.equalToSuperview()
            make.height.equalTo(0.5)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
        
    }
    
    var model:ListModel? {
        
        didSet {
            
            label.text = model?.name
            label1.text = model?.explain
            label.sizeToFit()
            label1.sizeToFit()
        }
    }
    
}
