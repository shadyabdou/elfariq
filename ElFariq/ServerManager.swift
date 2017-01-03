//
//  ServerManager.swift
//  DHCC_iOS
//
//  Created by Ayman Ibrahim Abdel Alim on 12/4/16.
//  Copyright © 2016 LinkDev. All rights reserved.
//

import UIKit
import Alamofire

enum Models:Int
{
    case Xx = 1
}

enum ErrorCode:Int
{
    case Caneled = -999
    case NoInternet = -1009
    case UnKnown = 000
}

struct Resource<A>
{
    var url: String
    let httpmethod: Alamofire.HTTPMethod
    let parse: (Any) -> A?
}

class ServerManager: NSObject
{
    var request:DataRequest?
    //Authentication
    private var headers = ["Content-Type": "application/json", "Accept": "application/json"]
    typealias DidFinishDelegate = (AnyObject?) -> ()
    var didFinish: DidFinishDelegate?
    typealias DidFinishWithErrorDelegate = (ErrorCode, Any?) -> ()
    var didFinishWithError: DidFinishWithErrorDelegate?
    
    //MARK: - HTTPHandling -
    func httpConnect<A>(resource:Resource<A>, paramters:[String:Any]?, authentication:String?, complation: @escaping (A?, Any?) -> (), errorHandler: @escaping (ErrorCode, Any?) -> ())
    {
        
        let url = resource.url
        if let auth = authentication
        {
            headers["Authorization"] = "bearer \(auth)"
        }
        request = Alamofire.request(url, method: resource.httpmethod, parameters: paramters, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<300).responseJSON
            { response in
                switch response.result
                {
                    case .success:
                        let value = response.result.value
                        //print(value!)
                        let parse = resource.parse
                        let result = value.flatMap(parse)
                        DispatchQueue.main.async
                        {
                            complation(result, value)
                        }
                    case .failure(let error):
                        //print(error._code)
                        print(error.localizedDescription)
                        DispatchQueue.main.async
                        {
                            /*
                            var msg:Any?
                            if let data = response.data
                            {
                                msg = try? JSONSerialization.jsonObject(with: data)
                            }*/
                            if let errorEnum = ErrorCode(rawValue: error._code)
                            {
                                errorHandler(errorEnum, error)
                            }
                            else
                            {
                                errorHandler(ErrorCode(rawValue: 000)!, error)
                            }
                        }
                    }
        }
    }
    
    func cancelRequest()
    {
        if let cancellingReq = request
        {
            cancellingReq.cancel()
        }
    }
}
