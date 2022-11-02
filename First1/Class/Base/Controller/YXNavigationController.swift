//
//  YXNavigationController.swift
//  First1
//
//  Created by New on 2022/7/25.
//

import UIKit

class YXNavigationController: UINavigationController {
    
    var titleText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
    
        titleText.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        titleText.text = "消息"
        titleText.sizeToFit()
        navigationItem.titleView = titleText
    }
}
