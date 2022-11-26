//
//  CityModel.swift
//  First1
//
//  Created by New on 2022/11/24.
//

import Foundation

class CityModel:BaseModel {
    
    lazy var count = 3
    
    let sectionMargin: CGFloat = 22
    
    //最近城市
    lazy var latelyCityArray:[String] = {

        let filePath = NSHomeDirectory().appending("/Documents/latelyCities.plist")
        let array = NSArray(contentsOfFile: filePath ) as? [String]
        return array ?? []
    }()
    //热门城市
    lazy var hotCityArray:[String] = {
        let path = Bundle.main.path(forResource: "hotCities.plist", ofType: nil)
        let array = NSArray(contentsOfFile: path ?? "") as? [String]
        return array ?? []
    }()
    
    //所有城市
    lazy var allCityDic: [String: [String]] = { () -> [String : [String]] in
        let path = Bundle.main.path(forResource: "cities.plist", ofType: nil)
        let dic = NSDictionary(contentsOfFile: path ?? "") as? [String: [String]]
        return dic ?? [:]
        }()
    
    //标题
    lazy var titleArray: [String] = { () -> [String] in
       var array = [String]()
        for str in allCityDic.keys {
            array.append(str)
        }
        // 标题排序
        array.sort()
        array.insert("热门", at: 0)
        array.insert("最近", at: 0)
        array.insert("当前", at: 0)
        return array
    }()
    
    var hotCityHeight:CGFloat {
        
        get {
            
            let btnMargin:CGFloat = 5
            let btnHeight:CGFloat = 25
            let top1:CGFloat = 15
            let row:CGFloat = ceil(CGFloat(hotCityArray.count) / 3)
            
            return btnHeight * row + btnMargin * (row - 1) + 2 * top1
        }
    }
    
    lazy var normalCityHeight:CGFloat = 44
    
    var latelyCityHeight:CGFloat {
        
        get {
            
            let btnMargin:CGFloat = 5
            let btnHeight:CGFloat = 25
            let top1:CGFloat = 15
            let row:CGFloat = ceil(CGFloat(latelyCityArray.count) / 3)
            
            return btnHeight * row + btnMargin * (row - 1) + 2 * top1
        }
    }
}
