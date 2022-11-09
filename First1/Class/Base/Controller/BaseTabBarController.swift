//
//  YXTabBarController.swift
//  First1
//
//  Created by New on 2022/5/24.
//

import UIKit

class BaseTabBarContrller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        AddChileVCWithArray()
    }
    
    func setupUI() {
        
//        self.tabBar.barTintColor=UIColor.coloWithHex(hexStr: "#ff0000", alpha: 0.5)
        self.tabBar.backgroundColor = UIColor.coloWithHex(hexStr: "#f8f8f8", alpha: 0.9)
        self.tabBar.tintColor = mColor
//        self.tabBar.isTranslucent = false
        
        if #available(iOS 11.0, *) {
            
            tabHeight = (UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0) + self.tabBar.size.height
        
        }else {
            
            tabHeight = self.tabBar.size.height
        }
        
    }
    
    func AddChileVCWithArray() {
        
        let VCArray : NSArray = [["YClass":"Test1","YTitle":"首页","YImage":"Leftbar_index_unselected","YSelImage":"Leftbar_index_selected"],["YClass":"Test2","YTitle":"消息","YImage":"Leftbar_cloud_unselected","YSelImage":"Leftbar_cloud_selected"],["YClass":"tabViewVC","YTitle":"业务","YImage":"Leftbar_shop_unselected","YSelImage":"Leftbar_shop_selected"],["YClass":"MVVM2Controller","YTitle":"我的","YImage":"Leftbar_mine_unselected","YSelImage":"Leftbar_mine_selected"]]
        
        for controller in VCArray {
            
            AddChileVCWithDic(dic: controller as! Dictionary<String, String>)
        }
        
    }
    
    func AddChileVCWithDic(dic:Dictionary<String,String>) {
        
        let YClass:String = dic["YClass"] ?? ""
        let YTitle:String = dic["YTitle"] ?? ""
        let YImage:String = dic["YImage"] ?? ""
        let YSelImage:String = dic["YSelImage"] ?? ""
        
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"]as!String
        let vcClass = NSClassFromString(namespace+"."+YClass)!as!UIViewController.Type
        
        let navigationVC = BaseNavigationController(rootViewController: vcClass.init())
        
        navigationVC.tabBarItem.image = UIImage.svgWithName(name: YImage, size: CGSize(width: 26, height: 26))
        
        navigationVC.tabBarItem.selectedImage = UIImage.svgWithName(name: YSelImage, size: CGSize(width: 26, height: 26))
        
        navigationVC.title = YTitle
        
        addChild(navigationVC)
        
    }
    
}

