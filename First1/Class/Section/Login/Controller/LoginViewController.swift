//
//  LoginViewController.swift
//  First1
//
//  Created by New on 2022/12/12.
//

import Foundation

class LoginViewController:UIViewController {
    
    var loginView:LoginView = LoginView()
    
    var model:LoginViewControllerModel = LoginViewControllerModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        
        let loginViewModel:LoginViewModel = LoginViewModel()
        
        loginView = LoginView.initWithModel(model: loginViewModel, frame: CGRect(x: 0, y: 0, width: ScreenW, height: ScreenH))
        
        view = loginView
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        navigationController?.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        changBarStyleWithStyle()
    }
    
    func changBarStyleWithStyle() {
        
        let nav:BaseNavigationController = self.navigationController as? BaseNavigationController ?? BaseNavigationController()
        
        nav.setBarStyleWithStyle(style: model.statusBarStyle)
    }
    
}

class LoginViewControllerModel:BaseModel {
    
    var statusBarStyle:UIStatusBarStyle = UIStatusBarStyle.default
}
