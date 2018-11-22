//
//  ViewController.swift
//  iBanwallet
//
//  Created by Carbon on 20/11/2018.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .red
        
        APIClient.getGists(successBlock: { (response) in
            print(response)
        }) { (error) in
            print(error)
        }
        
    }


}

