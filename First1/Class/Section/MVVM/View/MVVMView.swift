//
//  MVVMView.swift
//  First1
//
//  Created by New on 2022/10/31.
//

import Foundation
import UIKit

class MVVMView:BaseView {
    
    var iconImage:UIImageView = UIImageView.init()
    var nameLabel:UILabel = UILabel.init()
    var typeLabel:UILabel = UILabel.init()
    var button1:UIButton = UIButton.init()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
        
        addSubView1()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = UIColor.colorWithHex(hexStr: "#EA517F")
        
        typeLabel.font = UIFont.systemFont(ofSize: 16)
        typeLabel.textColor = UIColor.colorWithHex(hexStr: "#F07C82")
        
        
        button1.setTitle("点击", for: UIControl.State.normal)
        button1.setTitleColor(UIColor.colorWithHex(hexStr: "#E77C8E"), for: UIControl.State.normal)
        button1.addTarget(self, action: #selector(changNameLabel), for: UIControl.Event.touchUpInside)
        button1.sizeToFit()
        
    }
    
    func addSubView1() {
        
        addSubview(self.iconImage)
        addSubview(self.nameLabel)
        addSubview(self.typeLabel)
        addSubview(self.button1)
    }
    
    @objc func changNameLabel() {
        
        self.ViewModel = ViewModel?.changeLabel()
    }
    
    var ViewModel:MVVMViewModel? {
        
        didSet {
            
            nameLabel.text = ViewModel?.model?.name
            typeLabel.text = ViewModel?.typeCell
            nameLabel.sizeToFit()
            typeLabel.sizeToFit()
            iconImage.image = UIImage.svgWithName(name: ViewModel?.model?.icon ?? "zhantu")
        }
    }
    
    override func layoutSubviews() {
        
        iconImage.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(44)
            make.height.equalTo(44)
        }
        
        nameLabel.snp.makeConstraints { make in
            
            make.left.equalTo(iconImage.snp.right).offset(10)
            make.top.equalTo(iconImage).offset(2)
        }
        
        typeLabel.snp.makeConstraints { make in
            
            make.left.equalTo(iconImage.snp.right).offset(10)
            make.bottom.equalTo(iconImage).offset(-2)
        }
        
        
        button1.snp.makeConstraints { make in
            
            make.top.equalTo(iconImage.snp.bottom).offset(10)
            make.centerX.equalTo(iconImage)
        }
    }
    
    
}
