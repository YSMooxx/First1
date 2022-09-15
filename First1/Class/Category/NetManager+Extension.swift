//
//  NetManager+Extension.swift
//  First1
//
//  Created by New on 2022/9/15.
//

import Foundation
import Alamofire
import HandyJSON

typealias ResponseBlock<T:HandyJSON> = (_ responseModel:ResponseModel<T>) -> ()

extension NetManager{
///可无参数，无模型数据返回
class func request(url:String,
                   method:HTTPMethod = .post,
                   parametersDic:[String:String]? = [:],
                   resultBlock:ResponseBlock<ResponseDefault>?){
    self.request(url: url, method: method, parametersDic: parametersDic, modelType: ResponseDefault.self, resultBlock: resultBlock)
}
/// 可无参数
class func request<T:HandyJSON>(url:String,
                   method:HTTPMethod = .post,
                   parametersDic:[String:String]? = [:],
                   modelType:T.Type,
                   resultBlock:ResponseBlock<T>?){
    self.request(url: url, method: method, parameters: parametersDic, modelType: modelType, resultBlock: resultBlock)
}
/// 无模型数据返回
class func request<Parameters: Encodable>(url:String,
                                          method:HTTPMethod = .post,
                                          parameters:Parameters,
                                          resultBlock:ResponseBlock<ResponseDefault>?){
    self.request(url: url, method: method, parameters: parameters, modelType: ResponseDefault.self, resultBlock: resultBlock)
}

/// 数据模型返回
class func request<T:HandyJSON,Parameters: Encodable>(url:String,
                                                      method:HTTPMethod = .post,
                                                      parameters:Parameters,
                                                      modelType:T.Type,
                                                      resultBlock:ResponseBlock<T>?)
{
    NetManager.InitDataRequest(url: url, method: method, parameters: parameters)
        .responseString { string in
            
            if let error = string.error{
                print(error.errorDescription as Any)
                return
            }
            self.response(modelType, string.value,resultBlock)
        }
    }
    
    
    
    fileprivate class func InitDataRequest<Parameters: Encodable>(url:String,
                              method:HTTPMethod = .post,
                              parameters:Parameters? = nil
       ) -> DataRequest{
       
           let headers : HTTPHeaders = NetManager.defualt.YJBHeaders
           let encoder : ParameterEncoder = NetManager.defualt.YJBParameterEncoder
           let requestUrl = url
        
        let request:DataRequest = AF.request(requestUrl, method: method, parameters: parameters, encoder: encoder, headers: headers, interceptor: nil)
        
           return request
       }
    
    ///解析服务器返回的数据转化为model
    fileprivate class func response<T:HandyJSON>
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
}


