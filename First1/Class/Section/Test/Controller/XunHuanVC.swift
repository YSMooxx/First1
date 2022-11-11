//
//  XunHuanVC.swift
//  First1
//
//  Created by New on 2022/8/19.
//

import UIKit

class XunHuanVC :BaseViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func setupUI() {
        
        model.statusBarStyle = .lightContent
        
        let sMode:NavTitleModel = titleView.model ?? NavTitleModel()
        
        sMode.title = "地图"
        sMode.titleColor = "#FFFFFF"
        sMode.backColor = "#FF6600"
        sMode.vcCount = navigationController?.children.count ?? 1
        sMode.backImage = "back1"
        
        titleView.model = sMode
    }
    
    //for in 循环1
    func test1() {
        
        for index in 1...10 {
            
            if index<=3 {
                
                print("index 的值为 \(index)")
            }else {
                
                print("index 的值为 \(index)")
                break
            }
        }
    }
    
    //for in 循环2
    func test2() {
        
        let someInts:[Int] = [10, 20, 30,40,50]

        for index in someInts {
           print( "index 的值为 \(index)")
        }
    }
    
    //While 循环
    func test3() {
        
        var index = 10

        while index < 20
        {
           print( "index 的值为 \(index)")
           index = index + 1
        }
    }
    
    //repeat...while 循环
    func test4() {
        
        var index = 15

        repeat{
            print( "index 的值为 \(index)")
            index = index + 1
        }while index < 20
    }
    
    //Continue 语句
    func test5() {
        
        var index = 10

        repeat{
           index = index + 1
            
           if( index == 15 ){ // index 等于 15 时跳过
              continue
           }
           print( "index 的值为 \(index)")
        }while index < 20
    }
    
    //Continue 语句
    func test6() {
        
        var index = 10

        repeat{
           index = index + 1
            
           if( index == 15 ){ // index 等于 15 时跳过
              break
           }
           print( "index 的值为 \(index)")
        }while index < 20
    }
    
    //Swift Fallthrough 语句
    func test7() {
        
        var index = 100

        switch index {
           case 100  :
              index+=1
              print("index 的值为:\(index)")
            fallthrough
           case 10,15:
              index+=2
            print("index 的值为:\(index)")
            fallthrough
           case 5  :
              index+=3
            print("index 的值为:\(index)")
            fallthrough
           default :
              index+=4
            print("index 的值为:\(index)")
            
        }
    }
}
