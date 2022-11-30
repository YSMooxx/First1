//
//  LocationManager.swift
//  First1
//
//  Created by New on 2022/11/29.
//

import Foundation
import CoreLocation

class LocationManager:NSObject {
    
    var callBack: (_ city:String) ->() = {city in }
    
    static let shared: LocationManager = {
        
            let instance = LocationManager()
            
            return instance
    }()
    
    lazy var locationManager: CLLocationManager? = {
        
        let manager = CLLocationManager()
        // 设置代理
        manager.delegate = self
        // 设置定位精度
        manager.desiredAccuracy = kCLLocationAccuracyBest
        // 设置变动幅度
        manager.distanceFilter = 5.0
         // 允许后台持续使用定位功能
//        manager.allowsBackgroundLocationUpdates = truex
         // 进入后台后不停止
//        manager.pausesLocationUpdatesAutomatically = false
        //
        manager.requestAlwaysAuthorization()
        
        return manager
    }()
    
    public func startRequestLocation() {
        
        if (self.locationManager != nil) && (CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined || CLLocationManager.authorizationStatus() == .restricted) {
            // 没有获取到权限，再次请求授权
            self.locationManager?.requestWhenInUseAuthorization()
        } else {
            
            locationManager?.startUpdatingLocation()
        }
    }
    
    
}

extension LocationManager {
    
    func sendLocation(location:String){
        
        let hModel = gaodeHeaderModel()
        let pModel = gaodeParameterModel()
        
        pModel.location = location
        hModel.parameter = pModel
        
        NetManager.shard.request(netModel: hModel, success: {[weak self] (json) in
            
            let dict : Dictionary = json as! [String:Any]

            let dictString = JsonUtil.getJSONStringFromDictionary(dict: dict)
            
            let model:gaodeDataModel = JsonUtil.jsonToModel(dictString, gaodeDataModel.self) as! gaodeDataModel
            
            self?.locationManager?.stopUpdatingLocation()
            
            self?.callBack(model.regeocode?.addressComponent?.city ?? "")
            
        }, failure: {(error) in
            
            print(error)
        })
    }
    
    func sendLocation2(location:String){
        
        var url = "https://restapi.amap.com/v3/geocode/regeo?"
        
        url = url + "key=ce6391b3276fa3f7d396c72fef20f9cf" + "&location=" + location
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            if error != nil {
                print(error.debugDescription)
            }else{
//                print(String(data:data!, encoding: String.Encoding.utf8) ?? "空")
                if let any = try?JSONSerialization.jsonObject(with: data!, options: .allowFragments){
                    
                    let dict : Dictionary = any as! [String:Any]

                    let dictString = JsonUtil.getJSONStringFromDictionary(dict: dict)
                    
                    let model:gaodeDataModel = JsonUtil.jsonToModel(dictString, gaodeDataModel.self) as! gaodeDataModel
                    
                    let queue1 = DispatchQueue.main
                    
                    queue1.async {
                        
                        self?.callBack(model.regeocode?.addressComponent?.city ?? "")
                    }
                    
                }
               
            }
           
        }
    
        task.resume()
    }
    
}

extension LocationManager:CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last ?? CLLocation.init()
        let coordinate = location.coordinate
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        
        let latitudeS = String(latitude)
        let longitudeS = String(longitude)
        let locationS = longitudeS + "," + latitudeS
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss.SSS"
        
        let time = Date.init().timeIntervalSince1970 * 1000
        print(formatter.string(from: Date.init()))
        print(Date.init())
        print(Int(time))

        if Int(time) > UserDef.shard.locationTime + 30000 {
            
            sendLocation(location: locationS)
            UserDef.shard.locationTime = Int(time)
            UserDef.saveUserDefToSandBox()
        }
        
    }
    
    public func locationManager(_ manager: CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .notDetermined {//用户还没有选择授权
            
        } else if (status == .restricted) {//应用没有授权用户定位
            
        } else if (status == .denied) {//用户禁止定位
            
        }else if (status == .authorizedAlways) {//用户授权一直可以获取定位
           
        }else if (status == .authorizedWhenInUse) {//用户授权使用期间获取定位
           
        }
        
        locationManager?.startUpdatingLocation()
   }
    
    // 当获取定位出错时调用
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // 这里应该停止调用api
        
        locationManager?.stopUpdatingLocation()
    }
    
}


