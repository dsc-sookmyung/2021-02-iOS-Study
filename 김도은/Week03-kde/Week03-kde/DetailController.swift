//
//  DetailController.swift
//  Week03-kde
//
//  Created by doeun kim on 2021/10/24.
//

import UIKit

class DetailController : UIViewController {
    
    @IBAction func back_moveBtn(_ sender: Any) {
            //push controller
            self.navigationController?.popViewController(animated: true)
            
        }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
