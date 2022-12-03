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
    
    func request(netModel:NetBaseModel,success:@escaping (_ json:Any)->Void,failure:@escaping (_ error:Any)->Void) {
        
        let method = HTTPMethod(rawValue: netModel.method)
        
        let parameter = JsonUtil.modelToDictionary(netModel.parameter)
        
        AF.session.configuration.timeoutIntervalForResource = 2
        
        AF.session.configuration.timeoutIntervalForRequest = 2
        
        AF.request(URL(string: netModel.url)!, method: method, parameters:parameter,requestModifier: { $0.timeoutInterval = 2}).responseData { (response) in

            switch response.result {

            case .success(let data):
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    success(json)
                } catch {
                    HUDManager.shouTextWithStringDelayDismiss(text: "获取数据错误", time: 1)
                }
                
                break
                
            case .failure(let error):
                
                failure(error)
     
                let afError:AFError? = error.asAFError(orFailWith: "")
                
                let reason:String = afError?.localizedDescription ?? ""
                
                if reason.contains("timed out") {
                    
                    HUDManager.shouTextWithStringDelayDismiss(text: "网络不好，请检查网络连接~", time: 1)
                }else if reason.contains("offline") {
                    
                    HUDManager.shouTextWithStringDelayDismiss(text: "网络未连接，请检查网络连接~", time: 1)
                }else if reason.contains("connection") {
                    
                    HUDManager.shouTextWithStringDelayDismiss(text: "网络未连接，请检查网络连接~", time: 1)
                }else {
                    
                    HUDManager.shouTextWithStringDelayDismiss(text: reason, time: 5)
                }
                
                break
            }

        }
    }
    
    func requestToken(netModel:NetBaseModel,success:@escaping (_ json:Any)->Void,failure:@escaping (_ error:Any)->Void) {
        
        let method = HTTPMethod(rawValue: netModel.method)
        
        let parameter = JsonUtil.modelToDictionary(netModel.parameter)
        
        let headers:HTTPHeaders = ["Authorization":UserDef.shard.token ?? ""]
        
        HUDManager.shouTextWithString(text: "开始请求")
        AF.request(URL(string: netModel.url)!, method: method, parameters:parameter,headers: headers,requestModifier: { $0.timeoutInterval = 5}).responseData { (response) in
            
            switch response.result {

            case .success(let data):

                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    success(json)
                } catch {
                    print("Error while decoding response from: \(String(describing: String(data: data, encoding: .utf8)))")
                }
                break
            case .failure(let error):

                failure(error)
                break
            }

        }
    }
    
}
