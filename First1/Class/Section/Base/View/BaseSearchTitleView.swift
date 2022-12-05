//
//  BaseSearchTitleView.swift
//  First1
//
//  Created by New on 2022/12/5.
//

import Foundation

@objc protocol SearchTitleDelegate : NSObjectProtocol {
    
    @objc optional func leftButtonClick()  -> Void
    @objc optional func rightButtonClick()  -> Void
    @objc optional func textFieldDidBeginEditing() -> Void
}

class BaseSearchTitleView:BaseView {
    
    weak var delegate : (SearchTitleDelegate)?
    
    private lazy var leftBtn:UIButton = UIButton()
    private lazy var searchView:UITextField = UITextField()
    private lazy var rightBtn:UIButton = UIButton()
    private lazy var leftsearchImage:UIImageView = UIImageView()
    
    lazy var model:BaseSearchTitleModel = BaseSearchTitleModel()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
        addSubviewDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        //leftBtn
        leftBtn.addTarget(self, action:#selector(leftClick), for: UIControl.Event.touchUpInside)
        leftBtn.setTitleColor(.black, for: UIControl.State.normal)
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        
        //rightBtn
        rightBtn.addTarget(self, action:#selector(rightClick), for: UIControl.Event.touchUpInside)
        rightBtn.setTitleColor(.black, for: UIControl.State.normal)
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        
        //searchView
        searchView.delegate = self
        searchView.backgroundColor = UIColor.coloWithHex(hexStr: "#F8F8F8", alpha: 0.2)
        searchView.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        searchView.textColor = .white
        searchView.layer.cornerRadius = model.wh / 2
        searchView.layer.masksToBounds = true
        let attring = NSAttributedString(string: "输入您想搜索的服务", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)])
        searchView.attributedPlaceholder = attring
        
        let leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: model.wh, height: model.wh))
        leftsearchImage = UIImageView(frame: CGRect(x: (model.wh - model.searImageWH) / 2, y: (model.wh - model.searImageWH) / 2, width: model.searImageWH, height: model.searImageWH))
        leftsearchImage.image = UIImage.svgWithName(name: "search_white",size: CGSize(width: model.searImageWH, height: model.searImageWH))
        leftView.addSubview(leftsearchImage)
        searchView.leftView = leftView
        searchView.leftViewMode = .always
    }
    
    private func addSubviewDefault() {
        
        addSubview(leftBtn)
        addSubview(rightBtn)
        addSubview(searchView)
    }
    
    @objc func leftClick() {
        
        delegate?.leftButtonClick?()
    }
    
    @objc func rightClick() {
        
        delegate?.rightButtonClick?()
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        leftBtn.snp.makeConstraints { make in
            
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview().offset(model.top)
        }
        
        rightBtn.snp.makeConstraints { make in
            
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview().offset(model.top)
        }
        
        searchView.snp.makeConstraints { make in
            
            make.left.equalTo(leftBtn.snp.right).offset(15)
            make.centerY.equalTo(leftBtn)
            make.height.equalTo(model.wh)
            make.width.equalTo(ScreenW - leftBtn.size.width - 60 - rightBtn.size.width)
        }
    
    }
        
}

extension BaseSearchTitleView {
    
    public func searchTitlViewRefreshView() {
        
        //view
        if model.backClear {
            
            backgroundColor = .clear
        }else {
            
            backgroundColor = UIColor.colorWithHex(hexStr: model.backColor)
        }
        
        //letfBtn
        leftBtn.setImage(UIImage.svgWithName(name: model.leftImage, size: model.leftBtnSize), for: UIControl.State.normal)
        leftBtn.setTitle(model.leftText, for: UIControl.State.normal)
        leftBtn.setTitleColor(model.leftColor, for: UIControl.State.normal)
        leftBtn.sizeToFit()
        
        //rightBtn
        rightBtn.setImage(UIImage.svgWithName(name: model.rightImage, size: model.rightBtnSize), for: UIControl.State.normal)
        rightBtn.setTitle(model.rightText, for: UIControl.State.normal)
        rightBtn.setTitleColor(model.rightColor, for: UIControl.State.normal)
        rightBtn.sizeToFit()
        
        //重新布局
        setNeedsLayout()
    }
    
    public func titleViewBackClear() {
        
        backgroundColor = .clear
    }
    
    public func titleViewChangBackAlphaWithPoint(point:CGPoint) {
        
        let alpha = Float(point.y / navHeight)
        
        let color = UIColor.coloWithHex(hexStr: model.backColor, alpha: alpha)
        backgroundColor = color
    }
    
    public func titleViewChangSubViewColor(changde:Bool) {
        
        if changde {
            
            let attring = NSAttributedString(string: "输入您想搜索的服务", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)])
            searchView.attributedPlaceholder = attring
            searchView.backgroundColor = UIColor.coloWithHex(hexStr: "#F8F8F8", alpha: 1)
            
            leftBtn.setTitleColor(.black, for: UIControl.State.normal)
            leftBtn.setImage(UIImage.svgWithName(name: model.leftChangeImage, size: model.leftBtnSize), for: UIControl.State.normal)
            
            rightBtn.setTitleColor(.black, for: UIControl.State.normal)
            rightBtn.setImage(UIImage.svgWithName(name: model.rightChangeImage, size: model.rightBtnSize), for: UIControl.State.normal)
            
            leftsearchImage.image = UIImage.svgWithName(name: "search",size: CGSize(width: model.searImageWH, height: model.searImageWH))
        }else {
            
            let attring = NSAttributedString(string: "输入您想搜索的服务", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)])
            searchView.attributedPlaceholder = attring
            searchView.backgroundColor = UIColor.coloWithHex(hexStr: "#F8F8F8", alpha: 0.2)
            
            leftBtn.setTitleColor(.white, for: UIControl.State.normal)
            leftBtn.setImage(UIImage.svgWithName(name: model.leftImage, size: model.leftBtnSize), for: UIControl.State.normal)
            
            rightBtn.setTitleColor(.white, for: UIControl.State.normal)
            rightBtn.setImage(UIImage.svgWithName(name: model.rightImage, size: model.rightBtnSize), for: UIControl.State.normal)
            
            leftsearchImage.image = UIImage.svgWithName(name: "search_white",size: CGSize(width: model.searImageWH, height: model.searImageWH))
        }
    }
    
    func setletfContetn(text:String) {
        
        leftBtn.setTitle(text, for: UIControl.State.normal)
        leftBtn.sizeToFit()
        setNeedsLayout()
    }
}


extension BaseSearchTitleView:UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        delegate?.textFieldDidBeginEditing?()
        textField.resignFirstResponder()
    }
}

class BaseSearchTitleModel:BaseModel {
    
    //View
    var backColor:String = "#FFFFFF"
    var backClear:Bool = true
    
    var top:Int {
        
        get {
            
            var a : CGFloat = 0
            
            if statusBarHeight > 20 {
                
                a = statusBarHeight / 2 - ((statusBarHeight - 44) / 2)
            }else {
                
                a = statusBarHeight / 2
            }
            
            return Int(a)
        }
    }
    
    //letfbtn
    var leftImage:String = ""
    var leftChangeImage:String = "map_black"
    var leftText:String = ""
    var leftColor:UIColor = .white
    var leftBtnSize = CGSize(width: 30, height: 30)
    
    //letfbtn
    var rightImage:String = ""
    var rightChangeImage:String = "notification_black"
    var rightText:String = ""
    var rightColor:UIColor = .white
    var rightBtnSize = CGSize(width: 22, height: 22)
    
    //searchView
    var wh:CGFloat = 30
    var searImageWH:CGFloat = 19
    
    
}
