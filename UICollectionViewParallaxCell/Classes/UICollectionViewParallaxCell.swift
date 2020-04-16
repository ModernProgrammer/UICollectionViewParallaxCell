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
    public var parallaxImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    public let imageContainer : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        return view
    }()
}

// MARK: Parallax Functions
@available(iOS 9.0, *)
extension UICollectionViewParallaxCell {
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
        default:
            print()
        }
    }
}

// MARK: UI Function
@available(iOS 9.0, *)
extension UICollectionViewParallaxCell {
    public func setupbackgroundParallax(imageView: UIImageView, cornerRadius: CGFloat, paddingOffset: CGFloat, topConstraint: CGFloat, bottomConstraint: CGFloat, leadingConstraint: CGFloat, trailingConstraint: CGFloat) {
        parallaxImage = imageView
        self.paddingOffset = paddingOffset
        
        addSubview(imageContainer)
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: topAnchor, constant: topConstraint),
            imageContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomConstraint),
            imageContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingConstraint),
            imageContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -trailingConstraint)
        ])
        

        imageContainer.layer.cornerRadius = cornerRadius
        imageContainer.addSubview(parallaxImage)
        parallaxImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parallaxImage.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: -(paddingOffset + topConstraint)),
            parallaxImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: (paddingOffset + bottomConstraint)),
            parallaxImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: -(paddingOffset + leadingConstraint)),
            parallaxImage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: (paddingOffset + trailingConstraint))
        ])
    }
}

