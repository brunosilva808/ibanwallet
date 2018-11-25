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
    
    let labelTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    let labelDescription: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let imageIcon: UIImageView = {
        var image = UIImageView()
        image.isUserInteractionEnabled = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        setupViews()
        setupConstraints()
    }
    
    func setupData() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTouched))
        view.addGestureRecognizer(tapGesture)
        
        if let login = gist.owner?.login {
            labelTitle.text = "Login: \(login)"
        }

        if let description = gist.owner?.description {
            labelDescription.text = "Description: \(description)"
        }
        
        if let urlString = gist?.owner?.avatarUrl {
            imageIcon.kf.setImage(with: URL(string: urlString), placeholder: Image(named: "placeholder"), options: nil, progressBlock: nil) { [weak self] (_, _, _, _) in
                self?.imageIcon.setRounded(toRadius: 5)
            }
        }
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(labelTitle)
        view.addSubview(labelDescription)
        view.addSubview(imageIcon)
    }
    
    func setupConstraints() {
        constrain(labelTitle, self.view) { label, view in
            label.top == view.top + 16
            label.left == view.left + 16
            label.right == view.right + 16
        }

        constrain(labelDescription, labelTitle, self.view) { title, description, view in
            description.top == title.bottom + 16
            description.left == view.left + 16
            description.right == view.right + 16
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
