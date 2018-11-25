//
//  ViewController.swift
//  iBanwallet
//
//  Created by Bruno Silva on 20/11/2018.
//

import UIKit

class ViewController: UITableViewController {

    var shownIndexes : [IndexPath] = []
    private var finishedLoadingInitialTableCells = false
    var gists:[RealmGist] = []
    var detailViewController: DetailViewController!
    
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
    
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        var lastInitialDisplayableCell = false
        
        //change flag as soon as last displayable cell is being loaded (which will mean table has initially loaded)
        if gists.count > 0 && !finishedLoadingInitialTableCells {
            if let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows,
                let lastIndexPath = indexPathsForVisibleRows.last, lastIndexPath.row == indexPath.row {
                lastInitialDisplayableCell = true
            }
        }
        
        if !finishedLoadingInitialTableCells {
            
            if lastInitialDisplayableCell {
                finishedLoadingInitialTableCells = true
            }
            
            //animates the cell as it is being displayed for the first time
            cell.transform = CGAffineTransform(translationX: 0, y: cell.frame.height/2)
            cell.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0.05*Double(indexPath.row), options: [.curveEaseInOut], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.alpha = 1
            }, completion: nil)
        }
    }
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if (shownIndexes.contains(indexPath) == false) {
//            shownIndexes.append(indexPath)
//
//            cell.transform = CGAffineTransform(translationX: 0, y: cell.frame.height)
//            cell.layer.shadowColor = UIColor.black.cgColor
//            cell.layer.shadowOffset = CGSize(width: 10, height: 10)
//            cell.alpha = 0
//
//            UIView.beginAnimations("rotation", context: nil)
//            UIView.setAnimationDuration(0.5)
//            cell.transform = CGAffineTransform(translationX: 0, y: 0)
//            cell.alpha = 1
//            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
//            UIView.commitAnimations()
//        }
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.reusableCell(for: indexPath, with: gists[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailViewController = DetailViewController()
        detailViewController.gist = self.gists[indexPath.row]
        present(detailViewController, animated: true, completion: nil)
    }
    
}
