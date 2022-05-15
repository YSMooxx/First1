//
//  ViewController.swift
//  First1
//
//  Created by New on 2022/5/5.
//

import UIKit
import Darwin


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        say("111")
        say2("HaRi")
        say3()
        showArray(array: [1,2,3,4])
        var arr:Array<Int> = [23, 34, 56, 15, 8]
        bubbleSort(array: &arr, cmp: cmp)
        showArray(array: arr)
        bubbleSort1(array: &arr, cmp: cmp)
        showArray(array: arr)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let nextView = FirstController()
        self.present(nextView, animated: true) {
            
        }
    }
    
    

}




