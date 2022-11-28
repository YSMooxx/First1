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
    
    
    //所有城市Dic
    lazy var allCityDic: [String: [String]] = { () -> [String : [String]] in
        let path = Bundle.main.path(forResource: "cities.plist", ofType: nil)
        let dic = NSDictionary(contentsOfFile: path ?? "") as? [String: [String]]
        return dic ?? [:]
        }()
    
    //所有城市
    lazy var allCityArray:[String] = {
        var allArray:[String] = []
        for array in allCityDic.values {
            allArray.append(contentsOf: array)
        }
        return allArray
    }()
    
    //所有城市pinyin
    lazy var allCityPYArray:[String] = {
        var allArray:[String] = []
        for city in allCityArray {
            let pin = city.chineseToPinyin().removeAllSapce
            allArray.append(pin)
            
        }
        return allArray
    }()
    
    //所有城市pinyin缩写
    lazy var allCityPYSXArray:[String] = {
        var allArray:[String] = []
        for city in allCityArray {
            let pin = city.chineseToPinyin().getShouZiMu()
            allArray.append(pin)
        }
        return allArray
    }()
    
    //标题
    lazy var titleArray: [String] = { () -> [String] in
       var array = [String]()
        for str in allCityDic.keys {
            array.append(str)
        }
        // 标题排序
        array.sort()
        array.insert("热门城市", at: 0)
        array.insert("最近选择", at: 0)
        array.insert("当前定位", at: 0)
        return array
    }()
    
    lazy var titleArray2: [String] = { () -> [String] in
       var array = [String]()
        for str in allCityDic.keys {
            array.append(str)
        }
        // 标题排序
        array.sort()
        array.insert("火", at: 0)
        array.insert("☆", at: 0)
        array.insert("▲", at: 0)
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
