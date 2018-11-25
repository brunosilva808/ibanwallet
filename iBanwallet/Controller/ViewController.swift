//
//  ViewController.swift
//  iBanwallet
//
//  Created by Bruno Silva on 20/11/2018.
//

import UIKit

class ViewController: UITableViewController {

    private var finishedLoadingInitialTableCells = false
    private var gists:[RealmGist] = []
    private var detailViewController: DetailViewController!
    let transition = PopAnimator()
    var indexPath: IndexPath!
    
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.reusableCell(for: indexPath, with: gists[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.indexPath = indexPath
        
        detailViewController = DetailViewController()
        detailViewController.gist = self.gists[indexPath.row]
        detailViewController.transitioningDelegate = self
        present(detailViewController, animated: true, completion: nil)
    }
    
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
//        transition.originFrame =
//            selectedImage!.superview!.convert(selectedImage!.frame, to: nil)
        
        transition.presenting = true
//        selectedImage!.isHidden = true

        let rectOfCellInTableView = tableView.rectForRow(at: self.indexPath)
        let rectOfCellInSuperview = tableView.convert(rectOfCellInTableView, to: tableView.superview)
        
        transition.originFrame = rectOfCellInSuperview
        
//        print("Y of Cell is: \(rectOfCellInSuperview.origin.y)")
        
        return transition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition

    }
    
    
}
