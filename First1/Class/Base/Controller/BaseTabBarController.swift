//
//  YXTabBarController.swift
//  First1
//
//  Created by New on 2022/5/24.
//

import UIKit

class BaseTabBarContrller: UITabBarController {
    
    var customIndex:Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        AddChileVCWithArray()
        
    }
    
    func setupUI() {
    
        tabBar.backgroundColor = UIColor.coloWithHex(hexStr: "#f8f8f8", alpha: 1)
        tabBar.tintColor = mColor
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        delegate = self
        
        
        if #available(iOS 11.0, *) {
            
            tabHeight = (UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0) + self.tabBar.size.height
        
            if(UIApplication.shared.delegate?.window??.safeAreaInsets.bottom != 0) {
                
                isLiuHai = true
            }else {
                
                isLiuHai = false
            }
        }else {
            
            tabHeight = self.tabBar.size.height
        }
        
    }
    
    func AddChileVCWithArray() {
        
        let VCArray : NSArray = [["YClass":"ShouYeViewController","YTitle":"首页","YImage":"Leftbar_index_unselected","YSelImage":"Leftbar_index_selected"],["YClass":"Test2","YTitle":"消息","YImage":"Leftbar_cloud_unselected","YSelImage":"Leftbar_cloud_selected"],["YClass":"NavTest3","YTitle":"","YImage":"add-circle","YSelImage":"add-circle"],["YClass":"tabViewVC","YTitle":"业务","YImage":"Leftbar_shop_unselected","YSelImage":"Leftbar_shop_selected"],["YClass":"WaterFallController","YTitle":"我的","YImage":"Leftbar_mine_unselected","YSelImage":"Leftbar_mine_selected"]]
        
        for (index,controller) in VCArray.enumerated() {
            
            AddChileVCWithDic(index: index, dic: controller as! Dictionary<String, String>)
        }
        
    }
    
    func AddChileVCWithDic(index:Int,dic:Dictionary<String,String>) {
        
        let YClass:String = dic["YClass"] ?? ""
        let YTitle:String = dic["YTitle"] ?? ""
        let YImage:String = dic["YImage"] ?? ""
        let YSelImage:String = dic["YSelImage"] ?? ""
        
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"]as!String
        let vcClass = NSClassFromString(namespace+"."+YClass)!as!UIViewController.Type
        
        let navigationVC = BaseNavigationController(rootViewController: vcClass.init())
        
        if index == customIndex {
            
            if isLiuHai {
                
                navigationVC.tabBarItem.image = UIImage.svgWithName(name: YImage, size: CGSize(width: 48, height: 48)).withRenderingMode(.alwaysOriginal)
                
                navigationVC.tabBarItem.imageInsets = UIEdgeInsets.init(top: 4, left: 0, bottom: -4, right: 0)
                
            }else {
                
                navigationVC.tabBarItem.image = UIImage.svgWithName(name: YImage, size: CGSize(width: 44, height: 44)).withRenderingMode(.alwaysOriginal)
                
                navigationVC.tabBarItem.imageInsets = UIEdgeInsets.init(top: 5, left: 0, bottom: -5, right: 0)
            }
            
        }else {
            
            navigationVC.tabBarItem.image = UIImage.svgWithName(name: YImage, size: CGSize(width: 26, height: 26)).withRenderingMode(.alwaysOriginal)
            
            navigationVC.tabBarItem.selectedImage = UIImage.svgWithName(name: YSelImage, size: CGSize(width: 26, height: 26)).withRenderingMode(.alwaysOriginal)
        }
        
        navigationVC.tabBarItem.tag = index
        
        navigationVC.title = YTitle
        
        addChild(navigationVC)
        
    }
    
}

extension BaseTabBarContrller:UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController.tabBarItem.tag == customIndex {
            
            let vc = NavTest3()
            let nav = BaseNavigationController(rootViewController: vc)
            
            definesPresentationContext = true
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
            return false
        }else {
            
            return true
        }
        
        
    }
    
}

