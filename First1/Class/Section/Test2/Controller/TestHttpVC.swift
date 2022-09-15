//
//  TestHttpVC.swift
//  First1
//
//  Created by New on 2022/9/15.
//

import Foundation
import HandyJSON

class TestParam : Encodable{
    
//    var id  : Int?
}

class TestHttpVC:BaseViewController {
    
    override func viewDidLoad() {
    
        getData()
    }
    
    //get
    
    func getData() {
        
        let url = "http://qf.56.com/home/v4/moreAnchor.ios"
        let para = TestParam()
        
        NetManager.request(url: url, method: .get, parameters: para) { responseModel in
            
            print("error:\(responseModel.errorCode)")
        }
                           
    }
}
