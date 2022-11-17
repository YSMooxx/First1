//
//  MVVM2ListCell2.swift
//  First1
//
//  Created by New on 2022/11/2.
//

import UIKit

class MVVM2ListCell2:UITableViewCell {
    
    var label:UILabel = UILabel.init()
    var label1:UILabel = UILabel.init()
    var line:UIView = UIView.init()
    var iconImage:UIImageView = UIImageView.init()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //setupUI
    func setupUI() {
        
        selectedBackgroundView = UIView.init()
        selectedBackgroundView?.backgroundColor = mColorA
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.colorWithHex(hexStr: "#EA517F")
        
        label1.font = UIFont.systemFont(ofSize: 13)
        label1.textColor = UIColor.colorWithHex(hexStr: "#B2BBBE")
        
        line.backgroundColor = UIColor.colorWithHex(hexStr: "#FFEC3F")
    }
    
    //addView
    func addView() {
        
        contentView.addSubview(label)
        contentView.addSubview(label1)
        contentView.addSubview(iconImage)
        contentView.addSubview(line)
    }
    
    override func layoutSubviews() {
        
        selectedBackgroundView?.frame = self.bounds
        
        iconImage.snp.makeConstraints { make in
            
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(44)
            make.height.equalTo(44)
        }
        
        label.snp.makeConstraints { make in
            
            make.left.equalTo(iconImage.snp.right).offset(10)
            make.top.equalTo(iconImage).offset(2)
        }
        
        label1.snp.makeConstraints { make in
            
            make.left.equalTo(iconImage.snp.right).offset(10)
            make.bottom.equalTo(iconImage).offset(-2)
        }
        
        line.snp.makeConstraints { make in
            
            make.width.equalTo(ScreenW - 64)
            make.height.equalTo(0.5)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
        
    }
    
    var vModel:MVVM2ViewModel? {
        
        didSet {
            
            label.text = vModel?.subModel?.name
            label.textColor = UIColor.colorWithHex(hexStr: vModel?.subModel?.color ?? "#EA517F")
            label1.text = vModel?.subModel?.explain
            label.sizeToFit()
            label1.sizeToFit()
            
            let image:UIImage = UIImage.svgWithName(name: vModel?.subModel?.icon ?? "zhanwei", size: CGSize(width: 44, height: 44))
            
            iconImage.image = image
            
        }
    }
}
