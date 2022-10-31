//
//  MVVMViewModel.swift
//  First1
//
//  Created by New on 2022/10/31.
//

import Foundation

class MVVMViewModel:BaseViewModel {
    
    var typeCell:String = "default"
    
    var model:MVVMModel? {
        
        didSet {
            
            setWithModel(model: model ?? MVVMModel.init())
        }
    }
    
    
    func setWithModel(model:MVVMModel) {
        
        typeCell = model.name.uppercased()
    }
    
    func changeLabel() ->MVVMViewModel{
        
        let string: String = "Found"
        let cmodel: MVVMModel = self.model ?? MVVMModel.init()
        cmodel.name = string
        cmodel.icon = "nvIcon"
        self.model = cmodel
        
        return self
    }
    
    
}
