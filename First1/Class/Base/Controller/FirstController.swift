//
//  FirstController.swift
//  First1
//
//  Created by New on 2022/5/5.
//

import UIKit

class FirstController: UITableViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        self.view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.dismiss(animated: false)
    }
    
}

