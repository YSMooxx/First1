//
//  GouWuCellViewModel.swift
//  First1
//
//  Created by New on 2022/11/12.
//

import Foundation


class GouWuCellViewModel:BaseViewModel {
    
    enum Tyle {
        
        case Default
        case TwoLie
    }
    
    var imageHeight:CGFloat = 100
    
    var contentSize:CGSize = CGSize()
    
    var cellTyle:Tyle = .Default
    
    var sModel:GouWuCellModel? {
        
        didSet {
            
            getDateWithModel(model: sModel ?? GouWuCellModel())
        }
    }
    
    override func getdateWithsubModel(vm: BaseModel) {
        
        sModel = vm as? GouWuCellModel
    }
    
    func getDateWithModel(model:GouWuCellModel) {
        
        let margin: CGFloat = 8

        let margin2: CGFloat = 5

        let lie = 2

        let zongMargi:CGFloat =  CGFloat((lie + 1)) * margin

        let w:CGFloat = (ScreenW - zongMargi) / CGFloat(lie)
        
        let size:CGSize = self.sModel?.title.getSizeWithWidth(width: w, font: UIFont.systemFont(ofSize: 16)) ?? CGSize()
        
        self.contentSize = CGSize(width: w, height: size.height + (100) + margin2)
        
    }
}
