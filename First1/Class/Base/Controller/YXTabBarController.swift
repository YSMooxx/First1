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
        
        setupUI()
        AddChileVCWithArray()
        
    }
    
    func setupUI() {
        
        self.tabBar.barTintColor=UIColor.white
        self.tabBar.tintColor = UIColor.colorWithHex(hexStr: "#d4237a")
        self.tabBar.isTranslucent = false
        
    }
    
    func AddChileVCWithArray() {
        
        let VCArray : NSArray = [["YClass":"SwiftUIVC","YTitle":"UI","YImage":"Leftbar_index_unselected","YSelImage":"Leftbar_index_selected"],["YClass":"ZIMianLiangVC","YTitle":"字面量","YImage":"Leftbar_cloud_unselected","YSelImage":"Leftbar_cloud_selected"],["YClass":"BianLiangVC","YTitle":"变量","YImage":"Leftbar_shop_unselected","YSelImage":"Leftbar_shop_selected"],["YClass":"ViewController","YTitle":"我的","YImage":"Leftbar_mine_unselected","YSelImage":"Leftbar_mine_selected"]]
        
        for controller in VCArray {
            
            AddChileVCWithDic(dic: controller as! Dictionary<String, String>)
        }
        
    }
    
    func AddChileVCWithDic(dic:Dictionary<String,String>) {
        
        let YClass:String = dic["YClass"] ?? ""
        let YTitle:String = dic["YTitle"] ?? ""
        let YImage:String = dic["YImage"] ?? ""
        let YSelImage:String = dic["YSelImage"] ?? ""
        
        print(YImage)
        print(YSelImage)
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"]as!String
        let vcClass = NSClassFromString(namespace+"."+YClass)!as!UIViewController.Type
        
        let navigationVC = YXNavigationController(rootViewController: vcClass.init())
        
        navigationVC.tabBarItem.image = UIImage.svgWithName(name: YImage, size: CGSize(width: 26, height: 26))
        
        navigationVC.tabBarItem.selectedImage = UIImage.svgWithName(name: YSelImage, size: CGSize(width: 26, height: 26), color: UIColor.colorWithHex(hexStr: "#d4237a"))
        
        navigationVC.title = YTitle
        
        addChild(navigationVC)
        
    }
    
    
}

