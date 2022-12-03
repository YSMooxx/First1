//
//  NetTypeMananer.swift
//  First1
//
//  Created by New on 2022/11/21.
//

import Foundation
import Alamofire

class NetTypeMananer:NSObject {
    
    let newsHomeNetworkReachabilityManager = NetworkReachabilityManager(host: "http://www.baidu.com")
    
    class var shard:NetTypeMananer{
        
        struct Static {
            
            static let shard:NetTypeMananer = NetTypeMananer()
        }
        
        return Static.shard
    }
    
    func startListening() {
        
        newsHomeNetworkReachabilityManager?.startListening(onUpdatePerforming: {[weak self] state in
            
            switch state {
                    case .unknown:
                    HUDManager.shouTextWithString(text: "似乎与网络断开了连接!")
                        break
                    case .notReachable:
                    HUDManager.shouTextWithString(text: "似乎与网络断开了连接!")
                        break
                    case .reachable(.cellular):
                    HUDManager.shouTextWithString(text: "接入蜂窝数据网络")
                        break
                    case .reachable(.ethernetOrWiFi):
                    HUDManager.shouTextWithString(text: "接入Wi-Fi网络")
                        break
            }
            
            self?.stopListening()
            
            HUDManager.dismissWithDelay(time: 1)
        })
    }
    
    func stopListening() {
        
        newsHomeNetworkReachabilityManager?.stopListening()
        
    }
    
}
