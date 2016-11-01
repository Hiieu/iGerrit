//
//  cvc.swift
//  iGerrit
//
//  Created by Hieu Doan on 16/10/2016.
//  Copyright © 2016 hdoan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class CollectionViewController: UICollectionViewController {
    
    let serverUrl0 = "https://gerrit.bluesoft.net.pl/a/projects/?m=&n=26&type=ALL&d"
    let loginRequest = [
        "username" : "hdoan",
        "password" : "qE8XKcCUEX6l"
    ]
    
    var gInstances = [[
        "status": "NEW",
        "deletions": 69,
        "kind": "gerritcodereview#change",
        "insertions": 508759,
        "created": "2016-06-29 20:08:27.480000000",
        "change_id": "I1954a0b2fc10f442632ef8f54d127182d4297c19",
        "updated": "2016-06-29 20:08:27.480000000",
        "project": "IKO-SS",
        "owner": [
            "name": "John Smith"
        ],
        "mergeable": true,
        "branch": "master_inteligo",
        "_sortkey": "003e28380000301e",
        "_number": 12318,
        "id": "IKO-SS~master_inteligo~I1954a0b2fc10f442632ef8f54d127182d4297c19",
        "subject": "[RM#23864] DSD - Dopuszczalne Saldo Debetowe"
    ]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(serverUrl0, method: .get, encoding: JSONEncoding.default)
            .validate()
            .authenticate(user: loginRequest["username"]!, password: loginRequest["password"]!)
            .responseString { response in print(response)
                //to get status code
                print("xxx")
                print(response.data)
                print("man")
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                print(123)
                print(response.result.value)
                if var result = response.result.value {
                    result = result.replacingOccurrences(of: ")]}'", with: "")
                    let jj = JSON(result)
                    print(jj)
                    print("jjjjj")
                }
            
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gInstances.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as UICollectionViewCell
        let Label = cell.viewWithTag(1) as! UILabel
        Label.text = gInstances[indexPath.row]["subject"] as! String?
        return cell
    }
}
