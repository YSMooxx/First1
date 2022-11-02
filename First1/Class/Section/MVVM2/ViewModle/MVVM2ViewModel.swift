//
//  MVVM2ViewModel.swift
//  First1
//
//  Created by New on 2022/11/2.
//

import Foundation

class MVVM2ViewModel:BaseViewModel {
    
    //多个case分开写
    enum sexType {
        case nan
        case nv
    }
    
    var index:IndexPath = IndexPath.init(row: 0, section: 0) 
    var height:CGFloat = 44
    var sex:sexType = sexType.nan
    
    var model:MVVM2Model? {
        
        didSet {
            
            dealSexTyeWithInt(Sex: model?.sex ?? 0)
        }
    }
    
    func dealSexTyeWithInt(Sex:Int) {
        
        if Sex == 0 {
            
            sex = sexType.nv
        }else if Sex == 1 {
            
            sex = sexType.nan
        }
        
    }
    
}
