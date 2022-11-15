//
//  GouWuCell.swift
//  First1
//
//  Created by New on 2022/11/12.
//

import Foundation
import UIKit

class GouWuCell:UICollectionViewCell {
    
    let imageView:UIImageView = UIImageView()
    let titleLable:UILabel = UILabel()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
        addSubview1()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        titleLable.font = UIFont.systemFont(ofSize: 16)
        titleLable.textColor = UIColor.colorWithHex(hexStr: "#EA517F")
        titleLable.lineBreakMode = NSLineBreakMode.byCharWrapping
        titleLable.numberOfLines = 0
        
        contentView.backgroundColor = .gray
    }
    
    func addSubview1() {
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLable)
    }
    
    var vModel : GouWuCellViewModel? {
        
        didSet {
            
            imageView.setImageWithUrl(urlString: vModel?.model?.image ?? "" ,placeholderImage: "yuan1")
//            imageView.image = vModel?.image
            titleLable.text = vModel?.model?.title
            
            setNeedsLayout()
        }
    }
    
    override func setNeedsLayout() {
    
        super.setNeedsLayout()
        
        imageView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: vModel?.imageHeight ?? 0)
        
        titleLable.x = 0
        titleLable.y = (vModel?.imageHeight ?? 0) + 3
        titleLable.width = self.contentView.frame.size.width
        titleLable.sizeToFit()
        
    }
}
