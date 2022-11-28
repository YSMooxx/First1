//
//  testImageView.swift
//  First1
//
//  Created by New on 2022/11/22.
//

import Foundation
import UIKit

class testImageView:UIImageView {
    
    override init(frame: CGRect) {
    
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
