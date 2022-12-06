//
//  LunboqiCell.swift
//  First1
//
//  Created by New on 2022/12/6.
//

import UIKit

class LunboqiCell:UICollectionViewCell {
    
    lazy var imageView:UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
        addSubview1()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        contentView.backgroundColor = .gray
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
    
    func addSubview1() {
        
        contentView.addSubview(imageView)
    }
    
    var model:LunboqiCellModel? {
        
        didSet {
            
            imageView.setImageWithUrl(urlString: model?.imageUrl ?? "" ,placeholderImage: "yuan1") { image2, error1 in
                
            }
        }
    }
    
}

class LunboqiCellModel:BaseModel {
    
    var imageUrl:String = ""
    var pushUrl:String = ""
    var content:String = ""
}

