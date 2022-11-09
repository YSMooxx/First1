//
//  NavTitleView.swift
//  First1
//
//  Created by New on 2022/11/8.
//

import UIKit
import Foundation


protocol NavTitleViewDelegate : NSObjectProtocol {
    
    func didBackButton()
}

class NavTitleView:BaseView {
    
    weak var delegate : (NavTitleViewDelegate)?
    
    var titleLabel:UILabel = UILabel()
    var leftBtn:UIButton = UIButton()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
        addSubview1()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupUI() {
        
        backgroundColor = mColor
        isUserInteractionEnabled = true
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        leftBtn .addTarget(self, action:#selector(changTitle), for: UIControl.Event.touchUpInside)
        leftBtn.setTitle("返回", for: UIControl.State.normal)
        leftBtn.setTitleColor(.black, for: UIControl.State.normal)
    }
    
    @objc func changTitle() {
        
        delegate?.didBackButton()
    }
    
    func addSubview1() {
        
        addSubview(titleLabel)
        addSubview(leftBtn)
    }
    
    var model:NavTitleModel! {
        
        didSet {
            
            titleLabel.text = model?.title
            titleLabel.textColor = model?.titleColor
            backgroundColor = model?.backColor
            titleLabel.sizeToFit()
            leftBtn.isHidden = model?.backBtnHidden ?? true
            
            self.isHidden = model.viewHideen
        }
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        titleLabel.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(statusBarHeight / 2)
        }
        
        leftBtn.snp.makeConstraints { make in
            
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview().offset(statusBarHeight / 2)
        }
    }
}
