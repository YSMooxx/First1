//
//  HttpTool.swift
//  First1
//
//  Created by New on 2022/9/15.
//

import Foundation
import Alamofire
import HandyJSON

enum ResponseError  :   Int {

    case    unkown      =    0
    case    success     =   200
    case    failure     =   500
    case    expaired    =   401
    case    beOffLine   =   402
}

struct ResponseModel<T:HandyJSON>{

    var errorCode       :   ResponseError = .unkown
    var errorMessage    :   String = "未知错误"
    var model           :   T?
    var models          :   [T?]?
    var resultData      :   Any?
}

struct RequestHeaders : HandyJSON{

    var timestamp       :   String?
    var token           :   String?
    var sign            :   String?
}

struct ResponseDefault : HandyJSON {}

struct ResponseData : HandyJSON{

    var code    :   Int?
    var msg     :   String?
    var data    :   Any?
}

class NetManager {

    /// 单例
    public class var defualt : NetManager{
        struct Static {
            
            static let instance :NetManager = NetManager()
    }
        
    return Static.instance
}
    
var YJBHeaders : HTTPHeaders{
    get{
        var headers = RequestHeaders()
        headers.sign = ""
        headers.token = ""
        headers.timestamp = ""
        guard let jsonHeader = headers.toJSON() ,let jsonHeader = jsonHeader as? [String:String] else {
            return []
            }
        return HTTPHeaders.init(jsonHeader)
        }
    }
    /// 接口地址
    let RequestUrlHost : String = "http://test.17jbshop.com/"

    /// 参数编码方式
    let YJBParameterEncoder : ParameterEncoder = URLEncodedFormParameterEncoder.default
}
    

fileprivate func response<T:HandyJSON>
(
    _ modelType:T.Type,
    _ responseData:String?,
    _ resultBlock:ResponseBlock<T>?
){
    guard let resultBlock = resultBlock else {
        return
    }
    var responseModel = ResponseModel<T>()
    let baseModel = ResponseData.deserialize(from: responseData)
    
    guard let baseModel = baseModel else {
        return resultBlock(responseModel)
    }
    responseModel.errorCode = ResponseError(rawValue: baseModel.code ?? 0) ?? .unkown
    if let _ = baseModel.msg{
        responseModel.errorMessage = baseModel.msg!
    }
    responseModel.resultData = baseModel.data
    
    // 当被转模型数据不存在,停止转模型.
    guard let data = baseModel.data else {
        
        return resultBlock(responseModel)
    }
    if let dataArray = data as? [Any]{          // 解析数组
        
        responseModel.models = [T].deserialize(from: dataArray)
        return resultBlock(responseModel)
    }
    else if let data = data as? [String : Any]{     //解析字典
        
            responseModel.model = T.deserialize(from: data)
            return resultBlock(responseModel)
        }
    else{   //原样返回Data数据
        return resultBlock(responseModel)
    }
}

