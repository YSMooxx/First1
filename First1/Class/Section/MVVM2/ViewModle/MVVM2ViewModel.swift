//
//  MVVM2ViewModel.swift
//  First1
//
//  Created by New on 2022/11/2.
//

import Foundation
import UIKit

class MVVM2ViewModel:BaseViewModel {
    
    //多个case分开写
    enum sexType {
        case nan
        case nv
        case nn
    }
    
    var index:IndexPath = IndexPath.init(row: 0, section: 0) 
    var height:CGFloat = 44
    var imageHeight:CGFloat = 0
    var sex:sexType = sexType.nan
    
    var model:MVVM2Model? {
        
        didSet {
            
            dealSexTyeWithInt(model: model ?? MVVM2Model())
        }
    }
    
    func dealSexTyeWithInt(model:MVVM2Model) {
        
        if model.sex == 0 {
            
            sex = sexType.nv
        }else if model.sex == 1 {
            
            sex = sexType.nan
        }else if model.sex == 2 {
            
            sex = sexType.nn
            
            let image:UIImage = UIImage.init(named: model.icon) ?? UIImage()
            
            height = image.size.height * ScreenW / image.size.width
            
            model.height = height
        }
        
    }
    
}
