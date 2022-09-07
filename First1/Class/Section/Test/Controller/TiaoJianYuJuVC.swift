//
//  TiaoJianYuJuVC.swift
//  First1
//
//  Created by New on 2022/8/19.
//

import UIKit

class TiaoJianYuJuVC:UIViewController {
    
    override func viewDidLoad() {
        
        test6()
    }
    
    //if 语句
    func test1() {
        
        let varA:Int = 10;

        /* 检测条件 */
        if varA < 20 {
            /* 如果条件语句为 true 执行以下程序 */
            print("varA 小于 20");
        }
        print("varA 变量的值为 \(varA)");
    }
    
    // if...else 语句
    func test2() {
        
        let varA:Int = 100;

        /* 检测布尔条件 */
        if varA < 20 {
           /* 如果条件为 true 执行以下语句 */
//           print("varA 小于 20");
        } else {
           /* 如果条件为 false 执行以下语句 */
           print("varA 大于 20");
        }
        print("varA 变量的值为 \(varA)");
    }
    
    // if...else if...else 语句
    func test3() {
        
        let varA:Int = 100;

        /* 检测布尔条件 */
        if varA == 20 {
            /* 如果条件为 true 执行以下语句 */
            
        } else if varA == 50 {
            /* 如果条件为 true 执行以下语句 */
            
        } else {
            /* 如果以上条件都为 false 执行以下语句 */
            print("没有匹配条件");
        }
        print("varA 变量的值为 \(varA)");
    }
    
    //嵌套 if 语句
    func test5() {
        
        let varA:Int = 100;
        let varB:Int = 200;

        /* 检测布尔条件 */
        if varA == 100 {
           /* 如果条件为 true 执行以下语句 */
           print("第一个条件为 true");
            
           if varB == 200 {
              /* 如果条件为 true 执行以下语句 */
              print("第二个条件也是 true");
           }
        }
        print("varA 变量的值为 \(varA)");
        print("varB 变量的值为 \(varB)");
    }
    
    //switch 语句
    func test6() {
        
        var index = 10

        switch index {
           case 100  :
              index+=2
              print( "index 的值为 100")
           case 10,15  :
              index+=2
              print( "index 的值为 10 或 15")
           case 5  :
              index+=2
              print( "index 的值为 5")
           default :
              index+=2
              print( "默认 case")
        }
    }
}
