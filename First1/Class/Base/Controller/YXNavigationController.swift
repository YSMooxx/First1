//
//  YXNavigationController.swift
//  First1
//
//  Created by New on 2022/7/25.
//

import UIKit

class YXNavigationController: UINavigationController,UINavigationControllerDelegate {

    var popDelegate: UIGestureRecognizerDelegate?
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           setupUI3()
       }
    
    func setupUI1() {
        
        self.view.backgroundColor = .white

        // 解决侧滑返回失效问题
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
        
        self.navigationBar.shadowImage = UIImage()
        
        self.navigationBar.layer.shadowColor = UIColor.colorWithHex(hexStr: "c9c9c9").cgColor
        self.navigationBar.layer.shadowRadius = 20
        self.navigationBar.layer.shadowOpacity = 0.2
        self.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.navigationBar.tintColor = UIColor.orange
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = .white

        let appearance = UINavigationBar.appearance()
        appearance.shadowImage = UIImage()
        appearance.layer.shadowColor = UIColor.colorWithHex(hexStr:"c9c9c9").cgColor
        appearance.layer.shadowRadius = 20
        appearance.layer.shadowOpacity = 0.2
        appearance.layer.shadowOffset = CGSize(width: 0, height: 5)
        appearance.tintColor = UIColor.orange //前景色，按钮颜色
        appearance.isTranslucent = false // 导航条背景是否透明
        appearance.barTintColor = .white //背景色，导航条背景色
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)] // 设置导航条标题颜色，还可以设置其它文字属性，只需要在里面添加对应的属性
        
        // 解决iOS15 barTintColor设置无效的问题，参考https://developer.apple.com/forums/thread/682420
        if #available(iOS 13.0, *) {
            let newAppearance = UINavigationBarAppearance()
            newAppearance.configureWithOpaqueBackground()
            newAppearance.backgroundColor = .orange
            newAppearance.shadowImage = UIImage()
            newAppearance.shadowColor = nil
            newAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
            
            appearance.standardAppearance = newAppearance
            appearance.scrollEdgeAppearance = appearance.standardAppearance
        }
    }
    
    func setupUI2() {
        
        UINavigationBar.appearance().tintColor = UIColor.red
        //状态栏颜色
        navigationBar.barStyle = UIBarStyle.black
        
        //设置导航栏按钮为透明色图片
        //        
        navigationBar.isTranslucent = false
        //设置导航栏阴影为透明色图片
        //        navigationBar.shadowImage = UIImage.init(named: "tabbar_bill_normal")
        
        navigationBar.backgroundColor = UIColor.red
        
//        navigationBar.setBackgroundImage(UIImage.init(named: "back2"), for: UIBarMetrics.default)

        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.colorWithHex(hexStr: "#2775B6"),
                                             NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
                ]
    }
    
    func setupUI3() {
        
        popDelegate = interactivePopGestureRecognizer?.delegate
        delegate = self
        
//        navigationController?.navigationBar.barStyle = .blackTranslucent
        
        let appearance = UINavigationBar.appearance()
        
        appearance.setBackgroundImage(UIImage.init(named: "navBack"), for: UIBarMetrics.default)
//        appearance.isTranslucent = false
        appearance.shadowImage = UIImage()
        appearance.backgroundColor = mColor
        appearance.layer.shadowColor = UIColor.colorWithHex(hexStr:"c9c9c9").cgColor
        appearance.layer.shadowRadius = 1
        appearance.layer.shadowOpacity = 0.2
        appearance.layer.shadowOffset = CGSize(width: 0, height: 1)
        appearance.tintColor = UIColor.white
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)]
        
        if #available(iOS 13.0, *) {
            let newAppearance = UINavigationBarAppearance()
            newAppearance.configureWithOpaqueBackground()
            newAppearance.backgroundColor = mColor
            newAppearance.shadowImage = UIImage()
//            newAppearance.backgroundImage = UIImage.init(named: "navBack")
            newAppearance.shadowColor = nil
            newAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
            
            appearance.standardAppearance = newAppearance
            appearance.scrollEdgeAppearance = appearance.standardAppearance

        }
        
    }
}
