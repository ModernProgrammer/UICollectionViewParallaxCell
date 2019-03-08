#
# Be sure to run `pod lib lint UICollectionViewParallaxCell.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UICollectionViewParallaxCell'
  s.version          = '0.1.2'
  s.summary          = 'A parallax effect for a UICollectionViewCell.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This CocoaPod will easily allow you to add a parallax effect on either a vertical or horizontal scroll on a UICollectionView.'

  s.homepage         = 'https://github.com/ModernProgrammer/UICollectionViewParallaxCell'
  s.screenshots     = 'https://s3.amazonaws.com/diegophotos/github/ParallaxCells.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Diego Bustamante' => 'diegobust4545@icloud.com' }
  s.source           = { :git => 'https://github.com/ModernProgrammer/UICollectionViewParallaxCell.git'}

  s.ios.deployment_target = '9.0'
  s.source_files = 'UICollectionViewParallaxCell/Classes/**/*'
  
  # s.resource_bundles = {
  #   'UICollectionViewParallaxCell' => ['UICollectionViewParallaxCell/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
