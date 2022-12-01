//
//  HttpTool.swift
//  First1
//
//  Created by New on 2022/9/15.
//

import Foundation
import Alamofire
import HandyJSON

class NetManager:NSObject {
    
    class var shard:NetManager{
        
        struct Static {
            
            static let shard:NetManager = NetManager()
        }
        
        return Static.shard
    }
    
    lazy var manager:Session? = {
        
        let manager = AF

        manager.sessionConfiguration.timeoutIntervalForRequest = 15
        manager.sessionConfiguration.timeoutIntervalForResource = 15
        
        return manager
    }()
    
    func request(netModel:NetBaseModel,success:@escaping (_ json:Any)->Void,failure:@escaping (_ error:Any)->Void) {
        
        let method = HTTPMethod(rawValue: netModel.method)
        
        let parameter = JsonUtil.modelToDictionary(netModel.parameter)
        
        manager?.request(URL(string: netModel.url)!, method: method, parameters:parameter).responseJSON { (response) in
            
            switch response.result {
                
            case .success(let json1):
                
                success(json1)
                break
            case .failure(let error1):
                
                failure(error1)
                break
            }
            
        }
    }
    
    func requestToken(netModel:NetBaseModel,success:@escaping (_ json:Any)->Void,failure:@escaping (_ error:Any)->Void) {
        
        let method = HTTPMethod(rawValue: netModel.method)
        
        let parameter = JsonUtil.modelToDictionary(netModel.parameter)
        
        let headers:HTTPHeaders = ["Authorization":UserDef.shard.token ?? ""]
        
        HUDManager.shouTextWithString(text: "开始请求")
        manager?.request(URL(string: netModel.url)!, method: method, parameters:parameter,headers: headers).responseJSON { (response) in
            
            switch response.result {
                
            case .success(let json1):
                
                success(json1)
                break
            case .failure(let error1):
                
                
                failure(error1)
                break
            }
            
        }
    }
    
}
