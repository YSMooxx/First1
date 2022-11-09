//
//  YXNavigationController.swift
//  First1
//
//  Created by New on 2022/7/25.
//

import UIKit

class YXNavigationController: UINavigationController,UINavigationControllerDelegate,UIGestureRecognizerDelegate {

    enum navStyle {
        
        case Default
        case Search
    }
    var style:navStyle? {
        
        didSet {
            
            switch style {
                
            case .Default:
                
                setDefault()
                
                break
                
            case .Search:
                
                setSearch()
                break
                
            case .none:
                
                break
            }
        }
    }
    
    var titleLabel:UILabel = UILabel()
    var popDelegate: UIGestureRecognizerDelegate?
    var barStatyl:UIStatusBarStyle = .lightContent
    @objc var panGestureRec:UIScreenEdgePanGestureRecognizer?
    
    override func viewDidLoad() {
       super.viewDidLoad()
       
        setupUI()
        style = .Default
       
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return barStatyl
    }
    
    func setBarStyleWithStyle(style:UIStatusBarStyle) {
        
        barStatyl = style
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func setDefault() {
        
        setImageWithString(string: "navback", color: mColor,tColor: .white)
        setImageWithString13(string: "navback", color: mColor,fontcolor: .white)
        
        barStatyl = .lightContent
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func setSearch() {
        
        setImageWithString(string: "navback", color: UIColor.colorWithHex(hexStr: "f8f8f8"),tColor: .black)
        setImageWithString13(string: "navback", color: tColor,fontcolor: .black)
        
        barStatyl = .default
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func setImageWithString(string:String,color:UIColor,tColor:UIColor) {
        
        navigationBar.setBackgroundImage(UIImage.svgWithName(name: string, size: CGSize(width: navigationBar.bounds.width, height: navigationBar.bounds.height), color: color), for: UIBarMetrics.default)
        
        navigationBar.tintColor = tColor
        
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)]
        
        titleLabel.textColor = tColor
    }
    
    func setImageWithString13(string:String,color:UIColor,fontcolor:UIColor) {
        
        if #available(iOS 13.0, *) {
            
            let newAppearance = UINavigationBarAppearance()
            
            newAppearance.configureWithOpaqueBackground()
            
            newAppearance.shadowImage = UIImage()
            
            newAppearance.backgroundImage = UIImage.svgWithName(name: string, size: CGSize(width: navigationBar.bounds.width, height: navigationBar.bounds.height), color: color)
            
            newAppearance.shadowColor = nil
            
            newAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: fontcolor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
            
            navigationBar.standardAppearance = newAppearance
            
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
            
            navigationItem.titleView = titleLabel

        }
        
    }
    
    func setupUI() {
        
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        
        titleLabel.textColor = UIColor.white
        
        navigationBar.barStyle = UIBarStyle.default
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        popDelegate = interactivePopGestureRecognizer?.delegate
        delegate = self
        
        let appearance = UINavigationBar.appearance()
        
        appearance.isTranslucent = false
        
        appearance.shadowImage = UIImage()
        
        appearance.backgroundColor = .white
        
        appearance.setBackgroundImage(UIImage.svgWithName(name: "navback", size: CGSize(width: navigationBar.bounds.width, height: navigationBar.bounds.height),color: UIColor.coloWithHex(hexStr: "ff0000", alpha: 0.5)), for: UIBarMetrics.default)
        
        appearance.layer.shadowColor = UIColor.colorWithHex(hexStr:"c9c9c9").cgColor
        
        appearance.layer.shadowRadius = 1
        
        appearance.layer.shadowOpacity = 0.2
        
        appearance.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        appearance.tintColor = UIColor.white
        
    }
    
    
    
    
}
