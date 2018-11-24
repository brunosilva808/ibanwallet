//
//  ViewController.swift
//  iBanwallet
//
//  Created by Bruno Silva on 20/11/2018.
//

import UIKit

class ViewController: UITableViewController {

    var gists:[RealmGist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        getGists()
    }
    
    func setupTableView() {
        self.tableView.register(CustomCell.self)
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 250.0
    }

    func getGists() {
        APIClient.shared.getGists { [weak self] (response) in
            self?.gists = response
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.reusableCell(for: indexPath, with: gists[indexPath.row])
//        cell.indexPath = indexPath
        return cell
    }
    
}
