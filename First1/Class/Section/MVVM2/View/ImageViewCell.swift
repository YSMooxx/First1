//
//  ImageViewCell.swift
//  First1
//
//  Created by New on 2022/11/10.
//

import UIKit

class ImageViewCell:UITableViewCell {
    
    var backImageView:UIImageView = UIImageView.init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        addView()
    }
    
    
    
    //setupUI
    func setupUI() {
        backImageView.contentMode = UIView.ContentMode.scaleAspectFill
        backImageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //addView
    func addView() {

        contentView.addSubview(backImageView)
    }
    
    func changeWithPoint(y:CGFloat) {
        
        vModel?.imageHeight = (vModel?.height ?? 0) - y
        
        let fram:CGRect = CGRect(x: 0, y: y, width: ScreenW, height: vModel?.imageHeight ?? 0)
        
        backImageView.frame = fram
    }
    
    var vModel:MVVM2ViewModel? {
        
        didSet {
            
            let image:UIImage = UIImage.init(named: vModel?.subModel?.icon ?? "tabbar_bill_normal") ?? UIImage()
            
            backImageView.image = image

            backImageView.frame = CGRect(x: 0, y: 0, width: ScreenW, height: vModel?.height ?? 0)
        }
    }
    
}
