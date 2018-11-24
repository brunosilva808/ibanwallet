//
//  CustomCell.swift
//  iBanwallet
//
//  Created by Bruno Silva on 22/11/2018.
//

import UIKit
import Cartography

class CustomCell: UITableViewCell, ModelPresenterCell {

    let imageIcon: UIImageView = {
        var image = UIImageView(image: UIImage(named: "placeholder"))
        return image
    }()
    let labelTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let labelDescription: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var model: RealmGist? {
        didSet {
            guard let model = self.model else {
                return
            }
            
            labelTitle.text = model.owner?.login
            labelDescription.text = model.description
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(labelTitle)
        addSubview(labelDescription)
        addSubview(imageIcon)
    }
    
    func setupConstraints() {
        
        constrain(imageIcon, self) { imageView, view in
            imageView.top == view.top + 10
            imageView.left == view.left + 16
            imageView.width == 80
            imageView.height == 80
        }
        
        constrain(labelTitle, imageIcon, self) { label, imageView, view in
            label.top == view.top + 10
            label.left == imageView.right + 16
            label.right == view.right - 16
        }
        
        constrain(labelTitle, labelDescription, imageIcon, self) { title, description, imageView, view in
            description.top == title.bottom + 10
            description.left == imageView.right + 16
            description.right == view.right - 16
            description.bottom == view.bottom - 5
        }
        
    }

}
