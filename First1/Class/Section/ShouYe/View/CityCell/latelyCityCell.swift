//
//  latelyCityCell.swift
//  First1
//
//  Created by New on 2022/11/25.
//

import UIKit

class latelyCityCell:UITableViewCell {
    
    var callBack: (_ city:String) ->() = {city in }
    
    /// 懒加载 热门城市
    lazy var hotCities: [String] = {

        let filePath = NSHomeDirectory().appending("/Documents/latelyCities.plist")
        let array = NSArray(contentsOfFile: filePath) as? [String]
        return array ?? []
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        selectionStyle = .none
        
        self.backgroundColor = .white
        let btnMargin:CGFloat = 5
        let btnHeight:CGFloat = 25
        let top1:CGFloat = 15
        let left:CGFloat = 10
        let btnWidth:CGFloat = (ScreenW - 25 - 10 - btnMargin * 4) / 3
        // 动态创建城市btn
        for i in 0..<hotCities.count {
            // 列
            let column = i % 3
            // 行
            let row = i / 3
            //
            let btn = UIButton(frame: CGRect(x: left + btnMargin + CGFloat(column) * (btnWidth + btnMargin), y: top1 + CGFloat(row) * (btnHeight + btnMargin), width: btnWidth, height: btnHeight))
            btn.setTitle(hotCities[i], for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            btn.backgroundColor = UIColor.coloWithHex(hexStr: "#808080", alpha: 0.3)
            btn .addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
            contentView.addSubview(btn)
            
        }
    }
    
    @objc func btnClick(btn:UIButton) {
        
        callBack(btn.titleLabel?.text ?? "")
        
    }
}

