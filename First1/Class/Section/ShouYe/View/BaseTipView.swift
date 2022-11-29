//
//  BaseTipView.swift
//  First1
//
//  Created by New on 2022/11/28.
//

import UIKit

class BaseTipView:UIView {
    
    lazy var tipImageView:UIImageView = UIImageView()
    
    lazy var tipLabel1:UILabel = UILabel()
    
    lazy var tipLabel2:UILabel = UILabel()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
        
        addsubview1()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        backgroundColor = mColor
        isUserInteractionEnabled = false
        
        tipImageView.image = UIImage(named: "view_off")
        
        tipLabel1.text = "搜索结果为空"
        tipLabel1.textColor = .white
        tipLabel1.font = UIFont.systemFont(ofSize: 15)
        tipLabel1.sizeToFit()
        
        tipLabel2.text = "没有搜索到相关内容"
        tipLabel2.textColor = tColor
        tipLabel2.font = UIFont.systemFont(ofSize: 14)
        tipLabel2.sizeToFit()
    }
    
    private func addsubview1() {
        
        addSubview(tipImageView)
        addSubview(tipLabel1)
        addSubview(tipLabel2)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        tipImageView.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(110 * UserDef.shard.hRatio)
            make.width.height.equalTo(80)
        }
        
        tipLabel1.snp.makeConstraints { make in
            
            make.top.equalTo(tipImageView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        tipLabel2.snp.makeConstraints { make in
            
            make.top.equalTo(tipLabel1.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
    }
    
    
}
