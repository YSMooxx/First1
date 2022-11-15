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
    var clearCacheBtn:UIButton = UIButton()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
    }
    
    override func setupUI() {
        
        model.statusBarStyle = .lightContent
        
        let mode:NavTitleModel = titleView.model ?? NavTitleModel()
        mode.title = "消息"
        mode.backColor = "#2775B6"
        titleView.model = mode
        
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.colorWithHex(hexStr: "#000000")
        label.lineBreakMode = NSLineBreakMode.byCharWrapping
        label.numberOfLines = 0
        label.text = "总共：30M"
        label.sizeToFit()
        view.addSubview(label)
        
        clearCacheBtn.addTarget(self, action:#selector(clearCache), for: UIControl.Event.touchUpInside)
        clearCacheBtn.setTitleColor(.black, for: UIControl.State.normal)
        clearCacheBtn.setImage(UIImage.svgWithName(name:"zhantu", size: CGSize(width: 40, height: 40)), for: UIControl.State.normal)
        clearCacheBtn.sizeToFit()
        view.addSubview(clearCacheBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        getFileSize()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc:GouWuViewController = GouWuViewController()
        
        vc.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func clearCache() {
        
        String.clearCache {
            
            self.getFileSize()
        }
        
    }
    
    func getFileSize() {
        
        String.getCacheSize { size1 in
            
            self.label.text = size1
        }
    }
    
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        label.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-30)
        }
        
        clearCacheBtn.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(10)
        }
    }
    
}
