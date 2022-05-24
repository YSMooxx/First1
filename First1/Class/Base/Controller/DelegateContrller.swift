//
//  DelegateContrller.swift
//  First1
//
//  Created by New on 2022/5/24.
//

import UIKit

class DelegateController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let yellowCattle = YellowCattle()
        let person = Person()
        person.delegate = yellowCattle
        person.goToShanghai()
        person.canlePiao()
    }
}

@objc protocol BuyTicketDelegate {
    
    func buyTicket()
    func canle()
}

class Person {
    
    weak var delegate : BuyTicketDelegate?
    
    func goToShanghai(){
        delegate?.buyTicket()
    }
    
    func canlePiao(){
        delegate?.canle()
    }
}

class YellowCattle : BuyTicketDelegate {
    
    func buyTicket() {
        print("黄牛党帮你买了一张站票")
    }
    
    func canle() {
         
        print("黄牛党取消了一张票")
    }
}

class OtherDeletegate : BuyTicketDelegate {
    func buyTicket() {
        print("其他人帮你买了一张站票")
    }
    
    func canle() {
         
        print("其他人帮你取消了")
    }
}


