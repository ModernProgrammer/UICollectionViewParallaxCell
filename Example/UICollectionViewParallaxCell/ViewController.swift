//
//  ViewController.swift
//  UICollectionViewParallaxCell
//
//  Created by Diego Bustamante on 02/14/2019.
//  Copyright (c) 2019 Diego Bustamante. All rights reserved.
//

import UIKit


@available(iOS 11.0, *)
@available(iOS 11.0, *)
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    let photos = ["El_Capitan_-_MacBook_Pro_Wallpaper","Glacier_Falls_-_MacBook_Pro_Wallpaper","Lost_Coast_-_MacBook_Pro_Wallpaper","Sanoma_-_MacBook_Pro_Wallpaper","The_Surf_-_MacBook_Pro_Wallpaper"]
    let scrollDirection : UICollectionView.ScrollDirection = .horizontal
    
    lazy var collectionView:  UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.contentInsetAdjustmentBehavior = .never
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.register(ViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: Parallax
@available(iOS 11.0, *)
extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cells = collectionView.visibleCells as! [ViewCell]
        let bounds = collectionView.bounds
        for cell in cells {
            cell.parallaxOffset(collectionViewBounds: bounds, scrollDirecton: scrollDirection)
        }
    }
}

// MARK: UICollectionView Functions
@available(iOS 11.0, *)
extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ViewCell
        let bounds = collectionView.bounds
        // initiate parallax
        cell.paddingOffset = 150
        cell.parallaxOffset(collectionViewBounds: bounds, scrollDirecton: scrollDirection)
        cell.parallaxImage.image = UIImage(named: photos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = view.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

