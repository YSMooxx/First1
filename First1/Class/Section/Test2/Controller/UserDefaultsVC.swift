//
//  UserDefaultsVC.swift
//  First1
//
//  Created by New on 2022/9/8.
//

import UIKit
import Foundation


class UserDefaultsVC : UIViewController {
    
    override func viewDidLoad() {
        
        save1()
//        read1()
    }
    
    //test1
    func save() {
        
        let account : Account = Account.share()
        
        account.phone = "18922262750"
        
        account.saveToSandBox()
    }
    
    func read() {
        
        let phone : String = Account.share().phone
        
        print(phone)
    }
    
    //save1
    func save1() {
        
        UserDef.userDef.name = "咬卵匠"
        
        UserDef.userDef.num = "250"
        
        UserDef.saveUserDefToSandBox()
    }
    
    func read1() {
        
        print("name的值:\(UserDef.userDef.name!)")
        print("num的值:\(UserDef.userDef.num!)")
    }
}
