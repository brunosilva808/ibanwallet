//
//  CustomCell.swift
//  iBanwallet
//
//  Created by Bruno Silva on 22/11/2018.
//

import UIKit

class CustomCell: UITableViewCell, ModelPresenterCell {

    var titleLabel: UILabel = {
       var label = UILabel()
        return label
    }()
    let descriptionLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    var model: Gist? {
        didSet {
            guard let model = self.model else {
                return
            }
        }
    }


}
