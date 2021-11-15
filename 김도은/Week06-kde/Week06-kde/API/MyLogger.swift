//
//  MyLogger.swift
//  Week06-kde
//
//  Created by doeun kim on 2021/11/15.
//

import Foundation
import Alamofire

final class MyLogger : EventMonitor {
    
    let queue = DispatchQueue(label: "MyLogger")
    
    func requestDidResume(_ request: Request) {
        print("MyLogger - requestDidResume()")
        debugPrint(request)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("MyLogger - request.didParseResponse()")
        debugPrint(response)
    }
    
//    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
//
//        print("MyLogger - request.didParseResponse()")
//        debugPrint(response)
//
//    }
    
}
