//
//  LoginView.swift
//  First1
//
//  Created by New on 2022/12/12.
//

import UIKit

class LoginView:UIView {
    
    var model:LoginViewModel = LoginViewModel()
    
    ////logo imageView
    lazy var logoImageView:UIImageView = {
        
        let imageView:UIImageView = UIImageView(frame: CGRect(x: model.X, y: model.iconImageViewY, width: model.iconImageViewWidth, height: model.iconImageViewHeight))
        imageView.image = UIImage.init(named: model.iconImage)
        
        return imageView
    }()
    
    lazy var titleLabel:UILabel = {
        
        let label = UILabel()
        label.text = "登录/注册"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = UIColor.colorWithHex(hexStr: "#282828")
        label.sizeToFit()
        return label
    }()
    
    lazy var tipLabel:UILabel = {
        
        let label = UILabel()
        label.text = "新用户手首次登录即视为注册"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.colorWithHex(hexStr: "#35AA79")
        label.sizeToFit()
        
        return label
    }()
    
    lazy var accountTextField:UITextField = {
        
        let textField = UITextField()
        textField.backgroundColor = tColor
        textField.font = UIFont.systemFont(ofSize: 15)
  
        textField.placeholder = "请输入手机号"
        textField
        textField.returnKeyType = .search
        textField.addTarget(self, action: #selector(textViewDidChange), for: UIControl.Event.editingChanged)
        
        return textField
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUIWithModel(model: self.model)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    class func initWithModel(model:LoginViewModel,frame:CGRect) -> LoginView{
        
        let loginView:LoginView = LoginView(frame: frame)
        loginView.model = model
        return loginView
    }
    
    func setupUIWithModel(model:LoginViewModel) {
        
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(tipLabel)
        
        var maxY = model.iconImageViewY
        
        maxY = maxY + model.iconImageViewHeight + 17
        
        //标题label
        titleLabel.x = model.X
        titleLabel.y = maxY
        
        maxY = maxY + titleLabel.height + 8
        //说明label
        tipLabel.x = model.X
        tipLabel.y = maxY
    }
    
    @objc func textViewDidChange() {
        
        
    }
}

class LoginViewModel:BaseModel {
    
    //iconImageView
    var iconImageViewHeight:CGFloat = 41
    var iconImageViewWidth:CGFloat = 133
    var X:CGFloat = 17
    var iconImageViewY:CGFloat = navHeight
    var iconImage:String = "back2"
}
