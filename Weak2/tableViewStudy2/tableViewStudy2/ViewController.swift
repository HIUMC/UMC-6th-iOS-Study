//
//  ViewController.swift
//  tableViewStudy2
//
//  Created by 이수현 on 4/8/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var tableView: UITableView!
    let name = ["스티브잡스", "빌게이츠", "에이미"]
    let age = ["10", "25", "60"]
    
    let city = ["seoul", "busan", "daegu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    }
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView : UITableView)
}

