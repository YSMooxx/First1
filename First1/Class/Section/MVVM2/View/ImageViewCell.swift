//
//  ImageViewCell.swift
//  First1
//
//  Created by New on 2022/11/10.
//

import UIKit

class ImageViewCell:UITableViewCell {
    
    var backImageView:UIImageView = UIImageView.init()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    //addView
    func addView() {

        contentView.addSubview(backImageView)
    }
    
    func changeWithPoint(y:CGFloat) {
        
        vModel?.imageHeight = (vModel?.height ?? 0) - y
        
        let fram:CGRect = CGRect(x: 0, y: y, width: ScreenW, height: vModel?.imageHeight ?? 0)
        
        backImageView.frame = fram
    }
    
    override func layoutSubviews() {
        

    }
    
    var vModel:MVVM2ViewModel? {
        
        didSet {
            
            backImageView.image = UIImage.init(named: vModel?.model?.icon ?? "")
            backImageView.frame = CGRect(x: 0, y: 0, width: ScreenW, height: vModel?.height ?? 0)
            
            setupUI()
        }
    }
    
}
