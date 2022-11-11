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
    func setTableViewWith(top:CGFloat)
    func changTopWith(status:Bool)
}

class NavTitleView:BaseView {
    
    weak var delegate : (NavTitleViewDelegate)?
    
    var titleLabel:UILabel = UILabel()
    var leftBtn:UIButton = UIButton()
    var sy:CGFloat = 0
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        backgroundColor = mColor
        isUserInteractionEnabled = true
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        leftBtn .addTarget(self, action:#selector(changTitle), for: UIControl.Event.touchUpInside)
        leftBtn.setTitleColor(.black, for: UIControl.State.normal)
    }
    
    @objc func changTitle() {
        
        delegate?.didBackButton()
    }
    
    func setDateDefault() {
        
        titleLabel.text = model?.title
        titleLabel.textColor = UIColor.coloWithHex(hexStr: model?.titleColor ?? "", alpha: model?.aplha ?? 1)
        backgroundColor = UIColor.coloWithHex(hexStr: model?.backColor ?? "", alpha: model?.aplha ?? 1)
        titleLabel.sizeToFit()
        leftBtn.setImage(UIImage.svgWithName(name: model?.backImage ?? "", size: CGSize(width: 26, height: 26)), for: UIControl.State.normal)
        leftBtn.sizeToFit()
        
        self.setNeedsLayout()
        
        self.isHidden = model?.viewHideen ?? true
        
        if (model.vcCount > 1) {
            
            model.backBtnHidden = false
        }else {
            
            model.backBtnHidden = true
        }
        
        leftBtn.isHidden = model.backBtnHidden
    }
    
    func addSubviewDefault() {
        
        addSubview(titleLabel)
        addSubview(leftBtn)
    }
    
    func getPointFromScroll(oy:CGFloat) {
        
        let style = model.style
        
        switch style {
            
        case .Default:break
            
        case .ScrollShow:
            changAlhaWithPoint(oy: oy)
        case .Other: break
            
        }
        
        
    }
    
    func changAlhaWithPoint(oy:CGFloat) {
        
        if(oy > 0 && oy < (model?.imageHeight ?? 0) - navHeight) {
            
            let bilie:CGFloat = oy / ((model?.imageHeight ?? 0) - navHeight)
            
            isHidden = false
            
            backgroundColor = UIColor.coloWithHex(hexStr: model?.backColor ?? "#FFFFFF", alpha: Float(bilie))
            titleLabel.textColor = UIColor.coloWithHex(hexStr: model?.titleColor ?? "#FFFFFF", alpha: Float(bilie))
            
            model?.bilie = Float(bilie)
            
            delegate?.changTopWith(status: true)
            
        }else if (oy >= (model?.imageHeight ?? 0) - navHeight){
            
            if model?.bilie ?? 0 <= 1 {
                
                model?.bilie = 1
                
                backgroundColor = UIColor.coloWithHex(hexStr: model?.backColor ?? "#FFFFFF", alpha: 1)
                titleLabel.textColor = UIColor.coloWithHex(hexStr: model?.titleColor ?? "#FFFFFF", alpha: 1)
                
                isHidden = false
                
                delegate?.changTopWith(status: false)
            }
            
        }else {
            
            if self.isHidden != model?.viewHideen {
                
                self.isHidden = model?.viewHideen ?? true
            }
        }
        
    }
    
    var model:NavTitleModel! {
        
        didSet {
            
            let style = model.style
            
            switch style {
                
            case .Default:
                setDateDefault()
                addSubviewDefault()
                delegate?.setTableViewWith(top: 44)
            case .ScrollShow:
                setDateDefault()
                addSubviewDefault()
                delegate?.setTableViewWith(top: -statusBarHeight)
            case .Other: break
                
                
            }
        
        }
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let style = model.style
        
        switch style {
            
        case .Default:
            layoutSubviewsDefatult()
        case .ScrollShow:
            layoutSubviewsDefatult()
        case .Other: break
            
            
        }
    
    }
    
    func layoutSubviewsDefatult() {
        
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
