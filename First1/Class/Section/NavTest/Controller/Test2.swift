//
//  Test2.swift
//  SwiftTest
//
//  Created by New on 2022/11/8.
//

import UIKit
import SDWebImage

class Test2:BaseViewController {
    
    var label:UILabel = UILabel.init(frame: CGRect(x: 100, y: navHeight*3, width: 100, height: 20))
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
    }
    
    override func setupUI() {
        
        model.statusBarStyle = .lightContent
        
        let mode:NavTitleModel = titleView.model ?? NavTitleModel()
        
        mode.title = "消息"
        mode.backColor = "#2775B6"
        
        titleView.model = mode
        
        view.addSubview(label)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc:GouWuViewController = GouWuViewController()
        
        vc.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
