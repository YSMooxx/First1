//
//  GouWuCellViewModel.swift
//  First1
//
//  Created by New on 2022/11/12.
//

import Foundation

class GouWuCellViewModel:BaseModel {
    
    enum Tyle {
        
        case Default
        case TwoLie
    }
    
    var imageHeight:CGFloat = 0
    
    var contentHeight:CGFloat = 0
    
    var cellTyle:Tyle = .Default
    
    var model:GouWuCellModel? {
        
        didSet {
            
            getDateWithModel(model: model ?? GouWuCellModel())
        }
    }
    
    
    func getDateWithModel(model:GouWuCellModel) {
        
        let image:UIImage = UIImage.init(named: model.image) ?? UIImage()
        
        let margin: CGFloat = 8
        
        var lie = 1
        
        if cellTyle == .Default {
            
            lie = 1
        }else if cellTyle == .TwoLie {
            
            lie = 2
        }
        
        let zongMargi:CGFloat =  CGFloat((lie + 1)) * margin
        
        let w:CGFloat = (ScreenW - zongMargi) / CGFloat(lie)
        
        imageHeight = (image.size.height * w) / image.size.width
        
        let size:CGSize = model.title.getSizeWithWidth(width: w, font: UIFont.systemFont(ofSize: 16))
        
        contentHeight = size.height + imageHeight
    }
}
