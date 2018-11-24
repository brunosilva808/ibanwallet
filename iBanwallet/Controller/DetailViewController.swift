//
//  DetailViewController.swift
//  iBanwallet
//
//  Created by Bruno Silva on 24/11/2018.
//

import UIKit
import Cartography

class DetailViewController: UIViewController {

    let imageIcon: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupConstraints()
    }
    
//    func setupConstraints() {
//        
//        let marginLeftRight:CGFloat = 16
//        let marginTopBottom:CGFloat = 10
//        
//        constrain(imageIcon, self) { imageView, view in
//            imageView.top == view.top + marginTopBottom
//            imageView.left == view.left + marginLeftRight
//            imageView.bottom == view.bottom - marginTopBottom / 2 ~ LayoutPriority(rawValue: 250)
//            imageView.width == 40
//            imageView.height == 40
//        }
//    }

}
