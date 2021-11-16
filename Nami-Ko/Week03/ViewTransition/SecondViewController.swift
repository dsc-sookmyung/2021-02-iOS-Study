//
//  SecondViewController.swift
//  ViewTransition
//
//  Created by 고나미 on 2021/10/23.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func popToPrev() {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func dismissModal( {
        self.dismiss(animated: true, complition:nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
