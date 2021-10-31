//
//  ViewController.swift
//  ios alarm
//
//  Created by 고나미 on 2021/10/31.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
   
        
    struct Sunset {
        let title: String
        let time: String
    }
    
    let data: [Sunset] = [
        Sunset(title: "오전", time: "7:30"),
        Sunset(title: "오전", time: "8:10"),
        Sunset(title: "오전", time: "8:25"),
        Sunset(title: "오전", time: "8:45"),
        Sunset(title: "오전", time: "9:00"),
        Sunset(title: "오전", time: "9:12")

        
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sunset = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier:  "cell", for: indexPath) as! CustomTableViewCell
        cell.ampm.text = sunset.title
        cell.time.text = sunset.time
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    
    
    
