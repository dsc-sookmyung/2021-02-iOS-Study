//
//  MyApiStatusLogger.swift
//  Week06-kde
//
//  Created by doeun kim on 2021/11/15.
//

import Foundation
import Alamofire

final class MyApiStatusLogger : EventMonitor {
    
    let queue = DispatchQueue(label: "MyApiStatusLogger")
    
//    func requestDidResume(_ request: Request) {
//        print("MyApiStatusLogger - requestDidResume()")
//        debugPrint(request)
//    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        
        guard let statusCode = request.response?.statusCode else { return }
        
        print("MyApiStatusLogger - statusCode")
//        debugPrint(response)

    }
    
}
