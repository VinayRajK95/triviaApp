//
//  SummaryViewController.swift
//  Trivia App
//
//  Created by Vinay Raj K on 24/01/20.
//  Copyright © 2020 Vinay Raj K. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var users: [User]?
    
    var keys = ["name","favCricketer","colors"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        users = appdelegate.arrayUsers
        // Do any additional setup after loading the view.
    }

}

extension SummaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let users = users else {return 0}
        return users.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell") as? ConfigureCellProtocol {
            let key = keys[indexPath.row]
            let user = users![indexPath.section]
            cell.configureCell(key: key, value: user.value(forKey: key) as! String)
            return cell as! UITableViewCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Game "+"\(section+1)"
    }
}
