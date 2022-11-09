//
//  NavTitleView.swift
//  First1
//
//  Created by New on 2022/11/8.
//

import UIKit
import Foundation

private var top:CGFloat {
    
    get {
        
        var a : CGFloat = 0
        
        if statusBarHeight > 20 {
            
            a = statusBarHeight / 2 - ((statusBarHeight - 44) / 2)
        }else {
            
            a = statusBarHeight / 2
        }
        
        return a
    }
}

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
    
    
    
    private func setupUI() {
        
        backgroundColor = mColor
        isUserInteractionEnabled = true
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        leftBtn .addTarget(self, action:#selector(changTitle), for: UIControl.Event.touchUpInside)
        leftBtn.setTitleColor(.black, for: UIControl.State.normal)
        leftBtn.setImage(UIImage.svgWithName(name: "back2", size: CGSize(width: 32, height: 30)), for: UIControl.State.normal)
        leftBtn.sizeToFit()
    }
    
    @objc func changTitle() {
        
        delegate?.didBackButton()
    }
    
    private func addSubview1() {
        
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
    
    
    func changColor() {
        
        
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        titleLabel.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(top)
        }
        
        leftBtn.snp.makeConstraints { make in
            
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview().offset(top)
        }
    
    }
}
