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
        AddChileVCWithArray(array: VCArray)
        
        let dic = ["title":"123","name":"ddd"]

        print(dic)
        
    }
    
    func setupUI() {
        
        
        
    }
    
    var VCArray : NSArray = [["YClass":"FirstController1","YTitle":"消息","YImage":"","YSelImage":"",],["YClass":"DelegateController","YTitle":"代理","YImage":"","YSelImage":"",]]
    
    func AddChileVCWithArray(array:NSArray) {
        
        for s in array {
            
            AddChileVCWithDic(dic: s as! Dictionary<String, String>)
        }
        
    }
    
    func AddChileVCWithDic(dic:Dictionary<String,String>) {
        
        let YClass:String = dic["YClass"] ?? ""
        
        print(YClass)
        
    }
    
    
}
