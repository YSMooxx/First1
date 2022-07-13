//
//  YXTabBarController.swift
//  First1
//
//  Created by New on 2022/5/24.
//

import UIKit

class YXTabBarContrller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddChileVCWithArray()
        
    }
    
    func setupUI() {
        
        
        
    }
    
    func AddChileVCWithArray() {
        
        let VCArray : NSArray = [["YClass":"FirstController","YTitle":"消息","YImage":"","YSelImage":""],["YClass":"DelegateController","YTitle":"代理","YImage":"","YSelImage":""],["YClass":"ViewController","YTitle":"我的","YImage":"","YSelImage":""]]
        
        for controller in VCArray {
            
            AddChileVCWithDic(dic: controller as! Dictionary<String, String>)
        }
        
    }
    
    func AddChileVCWithDic(dic:Dictionary<String,String>) {
        
        let YClass:String = dic["YClass"] ?? ""
        let YTitle:String = dic["YTitle"] ?? ""
        let YImage:String = dic["YImage"] ?? ""
        print(YTitle)
        print(YImage)
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"]as!String
        let vcClass = NSClassFromString(namespace+"."+YClass)!as!UIViewController.Type
        let navigationVC = UINavigationController(rootViewController: vcClass.init())
        addChildViewController(navigationVC)
        
        navigationVC.title = YTitle
        
        addChildViewController(navigationVC)
        
    }
    
    
}

