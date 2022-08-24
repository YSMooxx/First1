//
//  HanShuVC.swift
//  First1
//
//  Created by New on 2022/8/24.
//

import UIKit

class HanShuVC:UIViewController {
    
    override func viewDidLoad() {
    
        print(runoob(site: "djy-es"))
        print(runoob(name: "菜鸟教程：", site: "www.runoob.com"))
        print(runoob(name: "Google：", site: "www.google.com"))
        test1(name: "七七", other: 123)
    }
    
    //函数调用
    func runoob(site: String) -> String {
        
        return ("www."+site+".com")
    }
    
    //函数参数
    func runoob(name: String, site: String) -> String {
        
        return name + site
    }
    
    func test1(name:String, other: Int)  {
        
        print("姓名：\(name)")
        let cc = other+2
        print("身高：\(cc)cm")
    }

    
}
