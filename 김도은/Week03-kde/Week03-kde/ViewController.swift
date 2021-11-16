//
//  ViewController.swift
//  Week03-kde
//
//  Created by doeun kim on 2021/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Click_moveBtn(_ sender: Any) {
        //storyBoard find Controller : DetailController
        //변수 - let
        //옵셔널 바인딩
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController") {
            //push controller
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        //storyBoard move Controller
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

