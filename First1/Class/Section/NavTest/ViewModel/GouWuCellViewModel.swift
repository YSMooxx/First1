//
//  GouWuCellViewModel.swift
//  First1
//
//  Created by New on 2022/11/12.
//

import Foundation

class GouWuCellViewModel:BaseModel {
    
    var imageHeight:CGFloat = 0
    
    var contentHeight:CGFloat = 0
    
    var model:GouWuCellModel? {
        
        didSet {
            
            getDateWithModel(model: model ?? GouWuCellModel())
        }
    }
    
    
    func getDateWithModel(model:GouWuCellModel) {
        
        let image:UIImage = UIImage.init(named: model.image) ?? UIImage()
        
        let  margin: CGFloat = 15
        
        let w:CGFloat = (ScreenW - 3 * margin) / 2
        
        imageHeight = (image.size.height * w) / image.size.width
        
        let size:CGSize = model.title.getSizeWithWidth(width: w, font: UIFont.systemFont(ofSize: 16))
        
        contentHeight = size.height + imageHeight
    }
}
