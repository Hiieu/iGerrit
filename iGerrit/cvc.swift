//
//  cvc.swift
//  iGerrit
//
//  Created by Hieu Doan on 16/10/2016.
//  Copyright © 2016 hdoan. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController {
    
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
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gInstances.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as UICollectionViewCell
        let Label = cell.viewWithTag(1) as! UILabel
        Label.text = gInstances[indexPath.row]["status"] as! String?
        return cell
    }
}
