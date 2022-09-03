//
//  FangFaVC.swift
//  First1
//
//  Created by New on 2022/9/2.
//

import UIKit

class FangFaVC:UIViewController {
    
    override func viewDidLoad() {
        
        test3()
    }
    
    //实列1
    func test1() {
        
        // 初始计数值是0
        let counter = Counter()
        print(counter.count)

        // 计数值现在是1
        counter.increment()
        print(counter.count)
        
        // 计数值现在是6
        counter.incrementBy(amount: 5)
        print(counter.count)

        // 计数值现在是0
        counter.reset()
        print(counter.count)
    }
    
    //实列2
    func test2() {
        
        let counter = division()
        counter.incrementBy(no1: 1800, no2: 3)
        counter.incrementBy(no1: 1600, no2: 5)
        counter.incrementBy(no1: 11000, no2: 3)
    }
    
    //实列3
    func test3() {
        
        let counter = multiplication()
        counter.incrementBy(first: 800, no2: 3)
        counter.incrementBy(first: 100, no2: 5)
        counter.incrementBy(first: 15000, no2: 3)
    }

}

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

class division {
    var count: Int = 0
    func incrementBy(no1: Int, no2: Int) {
        count = no1 / no2
        print(count)
    }
}

class multiplication {
    var count: Int = 0
    func incrementBy(first no1: Int, no2: Int) {
        count = no1 * no2
        print(count)
    }
}
