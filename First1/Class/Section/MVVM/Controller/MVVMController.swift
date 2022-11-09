//
//  MVVMController.swift
//  First1
//
//  Created by New on 2022/10/31.
//

import Foundation
import UIKit

class MVVMController:BaseViewController {
    
    let mView:MVVMView = MVVMView.init(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        
        let model:MVVMModel = MVVMModel.init()
        model.name = "xiaoyang"
        model.icon = "nanIcon"
        let Vmodel:MVVMViewModel = MVVMViewModel.init()
        Vmodel.model = model
        mView.ViewModel = Vmodel
        self.view = mView
    }
    
}
