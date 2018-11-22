//
//  ViewController.swift
//  iBanwallet
//
//  Created by Carbon on 20/11/2018.
//

import UIKit

class ViewController: UITableViewController {

    var gists:[Gist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getGists()
        tableView.register(CustomCell.self)
    }

    func getGists() {
        
        APIClient.shared.getGists(successBlock: { [weak self] (response) in
            self?.gists = response
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }

}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.reusableCell(for: indexPath, with: gists[indexPath.row])
        return cell
    }
}
