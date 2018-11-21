//
//  ViewController.swift
//  iBanwallet
//
//  Created by Carbon on 20/11/2018.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIClient.getGists(successBlock: { (response) in
            print(response)
        }) { (error) in
            print(error)
        }
        
        APIClient.getComics(onSuccess: { (response) in
            
        }) { (error) in
            
        }
        
    }


}

