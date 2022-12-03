//
//  CityTitleView.swift
//  First1
//
//  Created by New on 2022/11/24.
//

import UIKit

@objc protocol CityTitleViewDelegate : NSObjectProtocol {
    
    @objc optional func didBackButton()  -> Void
    @objc optional func searchViewBeginEdit()  -> Void
    @objc optional func searchViewEndEdit()  -> Void
    @objc optional func searchViewDidChange(text:String)  -> Void

}

class CityTitleView:BaseView {
    
    weak var delegate : (CityTitleViewDelegate)?
    
    private var top:CGFloat = statusBarHeight
    
    private lazy var searchView:UITextField = UITextField()
    private lazy var titleLabel:UILabel = UILabel()
    private lazy var leftBtn:UIButton = UIButton()
    private lazy var cancelBtn:UIButton = UIButton()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.setupUI()
        
        self.addSubview1()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        backgroundColor = mColor
        
        //searchView
        searchView.delegate = self
        searchView.backgroundColor = tColor
        searchView.font = UIFont.systemFont(ofSize: 15)
        searchView.frame = CGRect(x: 15, y: navHeight, width: ScreenW - 30, height: 35)
        searchView.layer.cornerRadius = 5
        searchView.layer.masksToBounds = true
        searchView.placeholder = "输入城市名称"
        let wh:CGFloat = 16
        let leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: searchView.size.height, height: searchView.size.height))
        let imageView:UIImageView = UIImageView(frame: CGRect(x: (searchView.size.height - wh) / 2, y: (searchView.size.height - wh) / 2, width: wh, height: wh))
        imageView.image = UIImage.svgWithName(name: "search",size: CGSize(width: wh, height: wh))
        leftView.addSubview(imageView)
        searchView.leftView = leftView
        searchView.leftViewMode = .always
        searchView.returnKeyType = .search
        searchView.addTarget(self, action: #selector(textViewDidChange), for: UIControl.Event.editingChanged)
        
        //标题label
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        
        //返回button
        leftBtn .addTarget(self, action:#selector(backClick), for: UIControl.Event.touchUpInside)
        leftBtn.setTitleColor(.black, for: UIControl.State.normal)
        
        //取消button
        cancelBtn .addTarget(self, action:#selector(cancelClick), for: UIControl.Event.touchUpInside)
        cancelBtn.setTitleColor(bColor, for: UIControl.State.normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        cancelBtn.setTitle("取消", for: UIControl.State.normal)
        cancelBtn.isHidden = true
    }
    
    func addSubview1() {
        
        addSubview(titleLabel)
        addSubview(leftBtn)
        addSubview(searchView)
        addSubview(cancelBtn)
    }
    
    @objc func backClick() {
        
        delegate?.didBackButton?()
    }
    
    @objc func textViewDidChange(textView:UITextView) {
        
        delegate?.searchViewDidChange?(text: textView.text ?? "")
        
        if textView.text?.count ?? 0 >= 1 {
            
            delegate?.searchViewBeginEdit?()
        }else {
            
            delegate?.searchViewEndEdit?()
        }
    }
    
    @objc func cancelClick() {
        
        searchView.resignFirstResponder()
        searchView.text = ""
        UIView.animate(withDuration: 0.3) {
            
            self.searchView.width = ScreenW - 30
            self.cancelBtn.isHidden = true
        } completion: { Bool in
            
            self.searchView.width = ScreenW - 30
            self.cancelBtn.isHidden = true
        }
        
        delegate?.searchViewEndEdit?()
    }
    
    var model:CityTitleModel? {
        
        didSet {
            
            titleLabel.text = model?.title
            titleLabel.sizeToFit()
            top = (44 - titleLabel.size.height) / 2 + statusBarHeight
            leftBtn.setImage(UIImage.svgWithName(name: "back1", size: CGSize(width: 26, height: 26)), for: UIControl.State.normal)
            leftBtn.setTitleColor(UIColor.red, for: UIControl.State.normal)
            leftBtn.sizeToFit()
        }
    }
    
    override func layoutSubviews() {
        
        titleLabel.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(top)
        }
        
        leftBtn.snp.makeConstraints { make in
            
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(top)
        }
        
        cancelBtn.snp.makeConstraints { make in

            make.centerY.equalTo(searchView)
            make.right.equalToSuperview().offset(-7)
        }
    }
    
}

extension CityTitleView:UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.3) {
            
            self.searchView.width = ScreenW - 65
            
        } completion: { Bool in
            
            self.searchView.width = ScreenW - 65
            self.cancelBtn.isHidden = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        model?.status = .searchClick
        searchView.resignFirstResponder()
        
        return true
    }
    
}

extension CityTitleView {
    
    func resign() {

        searchView.resignFirstResponder()
    }
    
}
