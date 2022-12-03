//
//  CityModel.swift
//  First1
//
//  Created by New on 2022/11/24.
//

import Foundation

class CityModel:BaseModel {
    
    lazy var count = 3
    lazy var sectionMargin: CGFloat = 22
    lazy var normalCityHeight:CGFloat = 44
    
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
    
    //侧面标题
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
    
    var latelyCityHeight:CGFloat {
        
        get {
            
            let btnMargin:CGFloat = 5
            let btnHeight:CGFloat = 25
            let top1:CGFloat = 15
            let row:CGFloat = ceil(CGFloat(latelyCityArray.count) / 3)
            
            return btnHeight * row + btnMargin * (row - 1) + 2 * top1
        }
    }
    
    func writeTolatelyCities(city:String) {
        
        let filePath = NSHomeDirectory().appending("/Documents/latelyCities.plist")
        
        let array:NSMutableArray?
        
        if latelyCityArray.count == 0 {
            
            array = NSMutableArray()
            
            array?.add(city)
            
        }else {
            
            for city1 in latelyCityArray {
                
                if city1 == city {
                    
                    return
                }
            }
            
            array = NSMutableArray(contentsOfFile: filePath)
            
            array?.add(city)
            
            if array?.count ?? 0 > 5 {
                
                array?.removeObject(at: 0)
            }
        }
        
        array?.write(toFile:filePath ,atomically:true)
    }
    
    func dealStringReturnArray(text:String) -> [String]{
        
        var array:[String] = []
        
        if text.isIncludeChineseIn() {
            
            for str in allCityArray {
                
                if str.contains(text) {
                    
                    array.append(str)
                }
            }
        
        }else {
            
            let text1 = text.lowercased()
            
            let text2 = text1.removeAllSapce
            
            for (index,str) in allCityPYSXArray.enumerated() {
                
                if str.contains(text2) {
                    
                    array.append(allCityArray[index])
                }
            }
            
            if array.count == 0 {
                
                for (index,str) in allCityPYArray.enumerated() {
                    
                    if str.contains(text2) {
                        
                        array.append(allCityArray[index])
                    }
                }
            }
            
        }
        
        return array
    }
}
