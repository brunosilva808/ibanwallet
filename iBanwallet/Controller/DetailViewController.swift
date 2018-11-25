//
//  DetailViewController.swift
//  iBanwallet
//
//  Created by Bruno Silva on 24/11/2018.
//

import UIKit
import Cartography
import Kingfisher

class DetailViewController: UIViewController {

    var gist: RealmGist!
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTouched))
    let imageIcon: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        view.addGestureRecognizer(tapGesture)
        view.backgroundColor = .white
        view.addSubview(imageIcon)
        if let urlString = gist?.owner?.avatarUrl {
            imageIcon.kf.setImage(with: URL(string: urlString))
        }
        
        constrain(imageIcon, self.view) { image, view in
            image.edges == view.edges
        }
    }

}

extension DetailViewController {
    @objc func viewTouched() {
        dismiss(animated: true, completion: nil)
    }
}
