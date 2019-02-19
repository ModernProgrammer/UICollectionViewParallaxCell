//
//  UICollectionViewParallaxCell.swift
//  Pods-UICollectionViewParallaxCell_Example
//
//  Created by Diego Bustamante on 2/14/19.
//

import UIKit

@available(iOS 9.0, *)
open class UICollectionViewParallaxCell : UICollectionViewCell {
    public var paddingOffset: CGFloat = 0
    private let parallaxImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = false
        return image
    }()
    private let imageContainer : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        return view
    }()
}

// MARK: Parallax Functions
@available(iOS 9.0, *)
extension UICollectionViewParallaxCell {
    // Parallax Formula was taken from this great dude
    // https://www.youtube.com/watch?v=B3I2Bj_Y6p8
    public func parallaxOffset(collectionViewBounds bounds: CGRect, scrollDirecton: UICollectionView.ScrollDirection){
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let offset = CGPoint(x: center.x - self.center.x, y: center.y - self.center.y)
        switch scrollDirecton {
        case .vertical:
            let maxVerticalOffset = (bounds.height/2) + (self.bounds.height/2)
            let scaleFactor = paddingOffset / maxVerticalOffset
            let parallaxOffset = (-offset.y * scaleFactor)
            parallaxImage.transform = CGAffineTransform(translationX: 0, y: parallaxOffset)
        case .horizontal:
            let maxHorizontalOffset = (bounds.width/2) + (self.bounds.width/2)
            let scaleFactor = paddingOffset / maxHorizontalOffset
            let parallaxOffset = (-offset.x * scaleFactor)
            parallaxImage.transform = CGAffineTransform(translationX: parallaxOffset, y: 0)
        }
    }
    
}

// MARK: UI Function
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
@available(iOS 9.0, *)
extension UICollectionViewParallaxCell {
    public func setupbackgroundParallax(image: UIImage, paddingOffset: CGFloat, topConstraint: CGFloat, bottomConstraint: CGFloat, leadingConstraint: CGFloat, trailingConstraint: CGFloat) {
        parallaxImage.image = image
        
        self.paddingOffset = paddingOffset

        addSubview(imageContainer)
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.topAnchor.constraint(equalTo: topAnchor, constant: topConstraint).isActive = true
        imageContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomConstraint).isActive = true
        imageContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingConstraint).isActive = true
        imageContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -trailingConstraint).isActive = true
        imageContainer.addSubview(parallaxImage)
        
        parallaxImage.translatesAutoresizingMaskIntoConstraints = false
        parallaxImage.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: -(paddingOffset + topConstraint)).isActive = true
        parallaxImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: (paddingOffset + bottomConstraint)).isActive = true
        parallaxImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: -(paddingOffset + leadingConstraint)).isActive = true
        parallaxImage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: (paddingOffset + trailingConstraint)).isActive = true
    }
}

