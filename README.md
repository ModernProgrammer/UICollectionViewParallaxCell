# UICollectionViewParallaxCell

[![Version](https://img.shields.io/cocoapods/v/UICollectionViewParallaxCell.svg?style=flat)](https://cocoapods.org/pods/UICollectionViewParallaxCell)
[![License](https://img.shields.io/cocoapods/l/UICollectionViewParallaxCell.svg?style=flat)](https://cocoapods.org/pods/UICollectionViewParallaxCell)
[![Platform](https://img.shields.io/cocoapods/p/UICollectionViewParallaxCell.svg?style=flat)](https://cocoapods.org/pods/UICollectionViewParallaxCell)

## Description

A simple way of implementing a parallax effect on a UICollectionView using this a Parallax Cell. With this Parallax Cell you will be able to easily implement a parallax effect on either a vertical or horizontal scroll.

![ParallaxCellDemo](https://s3.amazonaws.com/diegophotos/github/ParallaxCells.png)

Here is a video of a vertical scroll [Demo](https://youtu.be/wN3RaSWmP6I)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

UICollectionViewParallaxCell is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UICollectionViewParallaxCell'
```

Once installed, go to your Custom UICollectionViewCell class and import UICollectionViewParallaxCell
```ruby
import UICollectionViewParallaxCell
```

In your custom UICollectionViewCell class, inherit the UICollectionViewParallaxCell class.

```ruby
class CustomParallaxCell: UICollectionViewParallaxCell {...}
```

Within that class declare a UIImage 
```ruby
class CustomParallaxCell: UICollectionViewParallaxCell {
var backgroundImage : UIImage? {
        didSet {
            guard let image = backgroundImage else { return }
            setupbackgroundParallax(image: image, paddingOffset: paddingOffset, topConstraint: 0, bottomConstraint: 0, leadingConstraint: 0, trailingConstraint: 0)
        }
    }
}
```

*Note: paddingOffset is a variable declared within the UICollectionViewParallaxCell which by default is a CGFloat of 0. We will update the offset within the collectionView function, cellForItemAt.

In the class with your UICollectionView, go to your cellForItemAt function. 
Within in it declare the following:
```ruby
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomParallaxCell
        cell.paddingOffset = 150 // declares the offset intensity of parallax
        cell.backgroundImage = // pass through object to instantiate the setupbackgroundParallax function in the didSet
        let bounds = collectionView.bounds // variable for the collectionView bounds
        cell.parallaxOffset(collectionViewBounds: bounds, scrollDirecton: .vertical) // instantiate the inital bounds of the collectionview
        return cell
}
```

Next call the scrollViewDidScroll function in the class with your UICollectionView.
Declare the following.
```ruby 
func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cells = collectionView.visibleCells as! [CustomParallaxCell]
        let bounds = collectionView.bounds
        for cell in cells {
            cell.parallaxOffset(collectionViewBounds: bounds, scrollDirecton: .vertical)
        }
}
```

Run project and enjoy.


## Author

Diego Bustamante, diegobust4545@icloud.com

## License

UICollectionViewParallaxCell is available under the MIT license. See the LICENSE file for more info.
