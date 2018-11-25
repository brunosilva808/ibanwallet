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
    let labelType: UILabel = {
        let label = UILabel()
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

        if let description = gist.descriptionValue {
            labelDescription.text = "Description: \(description)"
        }

        if let type = gist.owner?.type {
            labelType.text = "Type: \(type)"
        }
        
        if let urlString = gist?.owner?.avatarUrl {
            imageIcon.kf.setImage(with: URL(string: urlString))
        }
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(labelTitle)
        view.addSubview(labelDescription)
        view.addSubview(labelType)
        view.addSubview(imageIcon)
    }
    
    func setupConstraints() {
        
        let margin:CGFloat = 16
        
        constrain(labelTitle, self.view) { label, view in
            label.top == view.top + margin
            label.left == view.left + margin
            label.right == view.right + margin
        }

        constrain(labelDescription, labelTitle, self.view) { description, title, view in
            description.top == title.bottom + margin
            description.left == view.left + margin
            description.right == view.right + margin
        }
        
        constrain(labelType, labelDescription, self.view) { type, description, view in
            type.top == description.bottom + margin
            type.left == view.left + margin
            type.right == view.right + margin
        }
        
        constrain(labelType, imageIcon, self.view) { type, image, view in
            image.top == type.bottom + margin
            image.left == view.left + margin
            image.right == view.right + margin
        }
    }

}

extension DetailViewController {
    @objc func viewTouched() {
        dismiss(animated: true, completion: nil)
    }
}
