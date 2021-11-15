//
//  Constants.swift
//  Week06-kde
//
//  Created by doeun kim on 2021/11/15.
//

import Foundation

enum SEGUE_ID {
    static let USER_LIST_VC = "goToUserListVC"
    static let PHOTO_COLLECTION_VC = "goToPhotoCollectionVC"
}

enum API {
    
    static let BASE_URL : String = "https://api.unsplash.com/"
    
    static let CLIENT_ID : String = "koOJlMATT9hpeG09P37xWhd1GJIDKMQv9Gf57Tb7XC8"
    
}

enum NOTIFICATION {
    enum API {
        static let AUTH_FAIL = "authentication_fail"
    }
}

