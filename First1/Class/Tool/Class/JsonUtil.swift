//
//  JsonUtil.swift
//  First1
//
//  Created by New on 2022/9/13.
//


import UIKit
import HandyJSON

class JsonUtil:NSObject {
    
    /**
         *  Json转对象
         */
        static func jsonToModel(_ jsonStr:String,_ modelType:HandyJSON.Type) ->BaseModel {
            if jsonStr == "" || jsonStr.count == 0 {
                #if DEBUG
                    print("jsonoModel:字符串为空")
                #endif
                return BaseModel()
            }
            return modelType.deserialize(from: jsonStr)  as! BaseModel
            
        }
    
    
    /**
         *  Json转数组对象
         */
        static func jsonArrayToModel(_ jsonArrayStr:String, _ modelType:HandyJSON.Type) ->[BaseModel] {
            if jsonArrayStr == "" || jsonArrayStr.count == 0 {
                #if DEBUG
                    print("jsonToModelArray:字符串为空")
                #endif
                return []
            }
            var modelArray:[BaseModel] = []
            let data = jsonArrayStr.data(using: String.Encoding.utf8)
            let peoplesArray = try! JSONSerialization.jsonObject(with:data!, options: JSONSerialization.ReadingOptions()) as? [AnyObject]
            for people in peoplesArray! {
                modelArray.append(dictionaryToModel(people as! [String : Any], modelType))
            }
            return modelArray
            
        }
    
    /**
         *  字典转对象
         */
        static func dictionaryToModel(_ dictionStr:[String:Any],_ modelType:HandyJSON.Type) -> BaseModel {
            if dictionStr.count == 0 {
                #if DEBUG
                    print("dictionaryToModel:字符串为空")
                #endif
                return BaseModel()
            }
            return modelType.deserialize(from: dictionStr) as! BaseModel
        }
        
        /**
         *  对象转JSON
         */
        static func modelToJson(_ model:BaseModel?) -> String {
            if model == nil {
                #if DEBUG
                    print("modelToJson:model为空")
                #endif
                 return ""
            }
            return (model?.toJSONString())!
        }
    
    /**
         *  对象转字典
         */
        static func modelToDictionary(_ model:BaseModel?) -> [String:Any] {
            if model == nil {
                #if DEBUG
                    print("modelToJson:model为空")
                #endif
                return [:]
            }
            return (model?.toJSON())!
        }
    
    
    class func getJSONStringFromArray(array: [Any]) -> String {
            if (!JSONSerialization.isValidJSONObject(array)) {
                print("无法解析出JSONString")
                return " "
            }
            if let data = try? JSONSerialization.data(withJSONObject: array, options: []), let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue) as String? {
                return JSONString
            }
            return " "
        }
    
    class func getJSONStringFromDictionary(dict:[String:Any]) -> String {
      var result:String = ""
      do {
        //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.init(rawValue: 0))

        if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
          result = JSONString
        }

      } catch {
        result = ""
      }
      return result
    }

    
}
