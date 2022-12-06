//
//  TestHttpVC.swift
//  First1
//
//  Created by New on 2022/9/15.
//

import Foundation
import HandyJSON

class LunboqiVC:UIViewController {
    
    lazy var lbqView:LunboqiView = LunboqiView(frame: CGRect(x: 0, y: navHeight, width: ScreenW, height: ScreenW / 1.7))
    
    lazy var lbqView2:LunboqiView = LunboqiView(frame: CGRect(x: 0, y: 2 * navHeight + ScreenW / 1.7, width: ScreenW, height: ScreenW / 1.7))
    
    override func viewDidLoad() {
    
        setupUI()
    }
    
    func setupUI() {
        
        lbqView.model.scrollModel = .horizontal
        view.addSubview(lbqView)
        lbqView.reloadData()
        
        lbqView2.model.scrollModel = .vertical
        view.addSubview(lbqView2)
        lbqView2.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        lbqView.addTimer()
        lbqView2.addTimer()
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        lbqView.removeTimer()
        lbqView.removeTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        UIImageView.clearMemory()
    }
    
}
