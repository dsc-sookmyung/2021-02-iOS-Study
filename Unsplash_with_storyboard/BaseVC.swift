//
//  BaseVC.swift
//  Unsplash_with_storyboard
//
//  Created by 고나미 on 2021/11/14.
//

import UIKit

class BaseVC: UIViewController {
    
    
      var vcTitle : String = "" {
          didSet {
              print("UserListVC - vcTitle didSet() called / vcTitle : \(vcTitle)")
              self.title = vcTitle
          }
      }
    
}
