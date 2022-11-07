//
//  TestController.swift
//  First1
//
//  Created by New on 2022/8/10.
//

import UIKit

class BianLiangVC: BaseViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        test()
    }
    
    override func setupNav() {
        
        title = "首页"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        let vc : tabViewVC = tabViewVC.init()
        
        vc.title = "下一页"
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Hello,World
    func test() {
        
        print(RW)
        print(RH)
    }
    //数据类型1
    func test1() {
        
        typealias Feet = Int
        typealias Feet1 = Float
        typealias Feet2 = Double
        typealias yn = Bool
        typealias c = Character
        let distance: Feet = 100
        let ddd: Feet1 = 0.0000000000000001
        let ccc: Feet2 = 0.00000000000000000001
        let re: yn = false
        let CCC: c = "C"
        print(distance,ddd,ccc,re,CCC)
    }
    //数据类型2
    func test2() {
        
        let meaningOfLife = 42
        let pi = 3.14159
        let anotherPi = 3 + 0.14159
        print(meaningOfLife,pi,anotherPi)
    }
    
    //变量
    func test3() {
        
        let varA = 42
        print(varA)

        var varB:Float

        varB = 3.14159
        print(varB)
        
        let _var = "Hello, Swift!"
        print(_var)

        let 你好 = "你好世界"
        let 菜鸟教程 = "www.runoob.com"
        print(你好)
        print(菜鸟教程)
        
        var name = "123"
        name = "菜鸟教程"
        let site = "http://www.runoob.com"

        print("\(name)的官网地址为：\(site)")
    }
    
    //强制解析
    func test4() {
        
        var myString:String?

        myString = "Hello, Swift!"

        if myString != nil {
            print(myString!)
        }else{
           print("myString 值为 nil")
        }
    }
    
    //自动解析
    func test5() {
        
        let defaulAddress:String = "dddd"
        print(defaulAddress)
        
    }
    
    
}
