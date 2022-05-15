//
//  FirstController.swift
//  First1
//
//  Created by New on 2022/5/5.
//

import UIKit

class FirstController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.dismiss(animated: false);
    }
    
}

