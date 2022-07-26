//
//  YXNavigationController.swift
//  First1
//
//  Created by New on 2022/7/25.
//

import UIKit

class YXNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        self.navigationBar.backgroundColor = UIColor.red
        
    }
}
