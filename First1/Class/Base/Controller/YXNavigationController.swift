//
//  YXNavigationController.swift
//  First1
//
//  Created by New on 2022/7/25.
//

import UIKit

class YXNavigationController: UINavigationController,UINavigationControllerDelegate,UIGestureRecognizerDelegate {

    var popDelegate: UIGestureRecognizerDelegate?
    @objc var panGestureRec:UIScreenEdgePanGestureRecognizer?
    
       override func viewDidLoad() {
           super.viewDidLoad()
           
           setupUI1()
//           addPan()
       }
    
    func setupUI1() {
        
        popDelegate = interactivePopGestureRecognizer?.delegate
        delegate = self
        
        let appearance = UINavigationBar.appearance()

        appearance.isTranslucent = false
        
        appearance.shadowImage = UIImage()
        
        appearance.backgroundColor = .green
        
        appearance.setBackgroundImage(UIImage.svgWithName(name: "navback", size: CGSize(width: navigationBar.bounds.width, height: navigationBar.bounds.height),color: UIColor.coloWithHex(hexStr: "ff0000", alpha: 0.5)), for: UIBarMetrics.default)
        
        appearance.layer.shadowColor = UIColor.colorWithHex(hexStr:"c9c9c9").cgColor
        
        appearance.layer.shadowRadius = 1
        
        appearance.layer.shadowOpacity = 0.2
        
        appearance.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        appearance.tintColor = UIColor.black
        
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)]
        
        if #available(iOS 13.0, *) {
            let newAppearance = UINavigationBarAppearance()
            
            newAppearance.configureWithOpaqueBackground()
            
            newAppearance.backgroundColor = UIColor.coloWithHex(hexStr: "#ffffff", alpha: 0)
            
            newAppearance.shadowImage = UIImage()
            
            newAppearance.backgroundImage = UIImage.init(named: "navBack")
            
            newAppearance.shadowColor = nil
            
            newAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
            
            appearance.standardAppearance = newAppearance
            
            appearance.scrollEdgeAppearance = appearance.standardAppearance

        }
        
    }
    
    func addPan() {
        
        popDelegate = interactivePopGestureRecognizer?.delegate
        delegate = self
    }
}
