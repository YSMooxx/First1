//
//  ShengMingVC.swift
//  First1
//
//  Created by New on 2022/10/8.
//

import Foundation

class ShengMingVC:BaseViewController {
    
    //加载view
    override func loadView() {
        
        super.loadView()
        print(#line,#function)
    }
    
    //view加载完成
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(#line,#function)
    }
    
    //view即将显示
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        print(#line,#function)
    }
    
    //view即将布局子视图
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        print(#line,#function)
    }
    
    //view加载完子视图
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        print(#line,#function)
    }
    
    //view显示完成
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        print(#line,#function)
    }
    
    //view即将消失
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        print(#line,#function)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        self.navigationController?.pushViewController(SVGVC.init(), animated: true)
    }
    
}
