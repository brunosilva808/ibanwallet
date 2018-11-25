//
//  CustomCell.swift
//  iBanwallet
//
//  Created by Bruno Silva on 22/11/2018.
//

import UIKit
import Cartography
import Kingfisher
import SkeletonView

class CustomCell: UITableViewCell, ModelPresenterCell {

    let imageIcon: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
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
    
    var model: RealmGist? {
        didSet {
            guard let model = self.model else {
                return
            }
            
            hideAnimation()
            
            labelTitle.text = model.owner?.login
            labelDescription.text = model.descriptionValue
            if let urlString = model.owner?.avatarUrl {
                imageIcon.kf.setImage(with: URL(string: urlString), placeholder: Image(named: "placeholder"), options: nil, progressBlock: nil) { [weak self] (_, _, _, _) in
                    self?.imageIcon.setRounded(toRadius: 5)
                }
                
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        showAnimation()
    }
    
    func showAnimation() {
        [imageIcon, labelTitle, labelDescription].forEach {
            $0.showSkeleton(usingColor: .black)
        }
    }
    
    func hideAnimation() {
        [imageIcon, labelTitle, labelDescription].forEach {
            $0.hideSkeleton()
        }
    }
    
    func setupViews() {
        addSubview(labelTitle)
        addSubview(labelDescription)
        addSubview(imageIcon)
    }
    
    func setupConstraints() {
        
        let marginLeftRight:CGFloat = 16
        let marginTopBottom:CGFloat = 10
                
        constrain(imageIcon, self) { imageView, view in
            imageView.top == view.top + marginTopBottom
            imageView.left == view.left + marginLeftRight
            imageView.bottom == view.bottom - marginTopBottom / 2 ~ LayoutPriority(rawValue: 250)
            imageView.width == 40
            imageView.height == 40
        }
        
        constrain(labelTitle, imageIcon, self) { label, imageView, view in
            label.top == view.top + marginTopBottom / 2
            label.left == imageView.right + marginLeftRight
            label.right == view.right - marginLeftRight
        }
        
        constrain(labelTitle, labelDescription, imageIcon, self) { title, description, imageView, view in
            description.height >= 21
            description.top == title.bottom + marginTopBottom
            description.left == imageView.right + marginLeftRight
            description.right == view.right - marginLeftRight
            description.bottom == view.bottom - marginTopBottom / 2
        }
        
    }

}
