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
        
        let marginLeftRight:CGFloat = 16
        let marginTop:CGFloat = 20
        
        constrain(imageIcon, self.view) { image, view in
            image.top == view.top + marginLeftRight + marginTop
            image.left == view.left + marginLeftRight
            image.width == 40
            image.height == 40
        }

        constrain(labelTitle, imageIcon, self.view) { title, image, view in
            title.top == view.top + marginLeftRight + marginTop
            title.left == image.right + marginLeftRight
            title.right == view.right - marginLeftRight
        }

        constrain(labelTitle, labelDescription, imageIcon, self.view) { title, description, image, view in
            description.top == title.bottom + marginLeftRight
            align(left: description, title)
            align(right: description, title)
        }

        constrain(labelType, labelDescription, labelTitle, self.view) { type, description, title, view in
            type.top == description.bottom + marginLeftRight
            align(left: type, title)
            align(right: type, title)
        }
        
    }

}

extension DetailViewController {
    @objc func viewTouched() {
        dismiss(animated: true, completion: nil)
    }
}
