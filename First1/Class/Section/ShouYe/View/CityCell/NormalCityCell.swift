//
//  NormalCityCell.swift
//  First1
//
//  Created by New on 2022/11/25.
//

import UIKit

class NormalCityCell:UITableViewCell {
    
    private lazy var titleLabel:UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        
        addSubview1()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        selectionStyle = .none
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    private func addSubview1() {
        
        contentView.addSubview(titleLabel)
    }
    
    var content:String? {
        
        didSet {
            
            titleLabel.text = content
            titleLabel.sizeToFit()
        }
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        titleLabel.snp.makeConstraints { make in
            
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
    }
}
