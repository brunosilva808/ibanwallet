//
//  ViewController.swift
//  iBanwallet
//
//  Created by Bruno Silva on 20/11/2018.
//

import UIKit

class ViewController: UITableViewController {

    var gists:[Gist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        getGists()
    }
    
    func setupTableView() {
        self.tableView.register(CustomCell.self)
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44.0
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
