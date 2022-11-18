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
    
    var height:CGFloat = 64

    var sex:sexType = sexType.nan
    
    var imageHeight:CGFloat = 0
    
    var subModel:MVVM2Model? {
        
        didSet {
            
            dealSexTyeWithInt(model: subModel ?? MVVM2Model())
        }
    }
    
    func dealSexTyeWithInt(model:MVVM2Model) {
        
        if model.sex == 0 {

            sex = sexType.nv
        
        }else if model.sex == 1 {
            
            sex = sexType.nan
            
        }else if model.sex == 2 {

            sex = sexType.nn

            let image:UIImage = UIImage(named: subModel?.icon ?? "titleimage3")!
            
            height = UIScreen.main.bounds.size.width * image.size.height / image.size.width
        }
        
    }
    
    override func getdateWithsubModel(vm: BaseModel) {
        
        subModel = vm as? MVVM2Model
        
    }
}
