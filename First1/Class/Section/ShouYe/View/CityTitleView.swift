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
    
    private lazy var searchView:UISearchBar = UISearchBar()
    private lazy var titleLabel:UILabel = UILabel()
    private lazy var tipLabel:UILabel = UILabel()
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
        searchView.backgroundImage = UIImage()
        let image = UIImage(named: "back")
        searchView.setSearchFieldBackgroundImage(image?.isRoundCorner(radius: 5, imageSize:  CGSize(width: ScreenW - 14, height: 35)), for: UIControl.State.normal)
        searchView.frame = CGRect(x: 7, y: navHeight, width: ScreenW - 14, height: 35)
        
        //提示label
        tipLabel.textColor = .gray
        tipLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        tipLabel.text = "输入城市或区县名称"
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
        addSubview(tipLabel)
        addSubview(cancelBtn)
    }
    
    @objc func backClick() {
        
        delegate?.didBackButton?()
    }
    
    @objc func cancelClick() {
        
        tipLabel.isHidden = false
        searchView.resignFirstResponder()
        searchView.text = ""
        UIView.animate(withDuration: 0.3) {
            
            self.searchView.width = ScreenW - 14
            self.cancelBtn.isHidden = true
        } completion: { Bool in
            
            self.searchView.width = ScreenW - 14
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
        
        tipLabel.snp.makeConstraints { make in

            make.centerY.equalTo(searchView)
            make.left.equalTo(searchView).offset(40)
        }
        
        cancelBtn.snp.makeConstraints { make in

            make.centerY.equalTo(searchView)
            make.right.equalToSuperview().offset(-7)
        }
    }
    
}

extension CityTitleView:UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        UIView.animate(withDuration: 0.3) {
            
            self.searchView.width = ScreenW - 49
            
        } completion: { Bool in
            
            self.searchView.width = ScreenW - 49
            self.cancelBtn.isHidden = false
        }
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        delegate?.searchViewDidChange?(text: searchBar.text ?? "")
        
        if searchText.count >= 1 {
            
            tipLabel.isHidden = true
            delegate?.searchViewBeginEdit?()
        }else {
            
            tipLabel.isHidden = false
            delegate?.searchViewEndEdit?()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        model?.status = .searchClick
        searchView.resignFirstResponder()
    }
    
    
}
