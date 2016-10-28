//
//  tbvc.swift
//  iGerrit
//
//  Created by Hieu Doan on 15/10/2016.
//  Copyright © 2016 hdoan. All rights reserved.
//

import UIKit

import Alamofire

class TableViewController: UITableViewController {
    
    var names = [String]()
    var last_names = [String]()
    let loginRequest = [
        "UserName" : "hdoan",
        "Password" : "qE8XKcCUEX6l"
    ]
    
    let serverUrl0 = "https://gerrit.bluesoft.net.pl/changes/?q=owner:self%20status:open"

    
    override func viewDidLoad() {
        names = ["orange", "white"]
        last_names = ["johnson", "henberg"]
        
        Alamofire.request(serverUrl0, method: .post, parameters: loginRequest).responseJSON {
                response in switch response.result {
                case .success:
                    print("Validation Successful")
                case .failure(let error):
                    print(error)
            }
        }
        
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
