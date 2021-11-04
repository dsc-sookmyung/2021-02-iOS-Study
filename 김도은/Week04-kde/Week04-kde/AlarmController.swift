//
//  ViewController.swift
//  Week04-kde
//
//  Created by doeun kim on 2021/10/30.
//

import UIKit

class AlarmController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBAction func editButton(_ sender: Any) {
    }
    @IBOutlet weak var AlarmTitle: UILabel!
    @IBAction func plusBtn(_ sender: Any) {
    }
    
    
    @IBOutlet var table: UITableView!
    
    private let sections: [String] = ["기타", "업무"]
    
    struct Sunset {
        let title: String
        let content: String
        let toggleSwitch: Bool
    }
    
    let data: [Sunset] = [
        Sunset(title: "오전 7:30", content: "알람", toggleSwitch: false),
        Sunset(title: "오전 8:10", content: "알람", toggleSwitch: false),
        Sunset(title: "오전 8:25", content: "알람", toggleSwitch: false),
        Sunset(title: "오전 8:45", content: "알람", toggleSwitch: false),
        Sunset(title: "오전 9:00", content: "알람", toggleSwitch: false),
        Sunset(title: "오전 9:12", content: "알람", toggleSwitch: false),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        table.delegate = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sunset = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(sunset.toggleSwitch, animated: true)
        switchView.tag = indexPath.row
        
        cell.accessoryView = switchView
        cell.alarmLabel.text = sunset.content
        cell.label.text = sunset.title
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

