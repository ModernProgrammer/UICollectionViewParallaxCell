//
//  ViewCell.swift
//  UICollectionViewParallaxCell_Example
//
//  Created by Diego Bustamante on 2/14/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import UICollectionViewParallaxCell

// Ensure you import and inherit from UICollectionViewParallaxCell
class ViewCell: UICollectionViewParallaxCell {
    let label : UILabel = {
        let label = UILabel()
        label.text = "TEST TEXT"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
