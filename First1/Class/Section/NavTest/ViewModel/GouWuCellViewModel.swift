//
//  GouWuCellViewModel.swift
//  First1
//
//  Created by New on 2022/11/12.
//

import Foundation

@objc protocol GouWuCellViewModelDelegate : NSObjectProtocol {
    
    @objc optional func comGetHeight() -> Void

}

class GouWuCellViewModel:BaseModel {
    
    enum Tyle {
        
        case Default
        case TwoLie
    }
    
    weak var delegate: GouWuCellViewModelDelegate?
    
    var imageHeight:CGFloat = 0
    
    var contentSize:CGSize = CGSize()
    
    var image:UIImage = UIImage.init(named: "yuan1")!
    
    var cellTyle:Tyle = .Default
    
    var model:GouWuCellModel? {
        
        didSet {
            
            getDateWithModel(model: model ?? GouWuCellModel())
        }
    }
    
    func getDateWithModel(model:GouWuCellModel) {
        
        let margin: CGFloat = 5
        
        let margin2: CGFloat = 3
        
        let lie = 2
        
        let zongMargi:CGFloat =  CGFloat((lie + 1)) * margin
        
        let w:CGFloat = (ScreenW - zongMargi) / CGFloat(lie)
        
        UIImage.initWithUrl(urlString: model.image) { [weak self] image1 in
            
            self?.image = image1
            
            self?.imageHeight = (image1.size.height * w) / image1.size.width

            let size:CGSize = self?.model?.title.getSizeWithWidth(width: w, font: UIFont.systemFont(ofSize: 16)) ?? CGSize()

            self?.contentSize = CGSize(width: w, height: size.height + (self?.imageHeight ?? 0) + margin2)
            
            self?.delegate?.comGetHeight?()
        }
        
    }
}
