//
//  tbvc.swift
//  iGerrit
//
//  Created by Hieu Doan on 15/10/2016.
//  Copyright © 2016 hdoan. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController {
    
    var names = [String]()
    var last_names = [String]()
    let loginRequest = [
        "UserName" : "hdoan",
        "Password" : "qE8XKcCUEX6l"
    ]

    
    override func viewDidLoad() {
        names = ["orange", "white"]
        last_names = ["johnson", "henberg"]
        
        GerritResource().callResource(routerMethod: Router.changes(items: nil))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
