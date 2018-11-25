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
        image.clipsToBounds = true
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
            label.right == view.right - margin
        }

        constrain(labelDescription, labelTitle) { description, title in
            description.top == title.bottom + margin
        }
        
        constrain(labelType, labelDescription) { type, description in
            type.top == description.bottom + margin
        }
        
        constrain(labelType, imageIcon) { type, image in
            image.top == type.bottom
        }
        
        constrain(labelTitle, labelDescription, labelType, imageIcon) { title, description, type, image in
            align(left: title, description, type, image)
            align(right: title, description, type, image)
        }
    }

}

extension DetailViewController {
    @objc func viewTouched() {
        dismiss(animated: true, completion: nil)
    }
}
