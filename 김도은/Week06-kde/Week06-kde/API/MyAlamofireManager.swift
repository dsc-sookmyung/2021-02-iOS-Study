//
//  MyAlamofireManager.swift
//  Week06-kde
//
//  Created by doeun kim on 2021/11/15.
//

import Foundation
import Alamofire

final class MyAlamofireManager {
    
    //싱글턴 적요
    static let shared = MyAlamofireManager()
    
    //인터셉터
    let interceptors = Interceptor(interceptors:
                        [
                            BaseInterceptor()
                        ])
    
    //로거 설정
    let monitors = [MyLogger(), MyApiStatusLogger()] as [EventMonitor]
    
    //세션 설정
    var session : Session
    
    private init() {
        session = Session(
            interceptor: interceptors,
            eventMonitors: monitors
        )
    }
    
}
