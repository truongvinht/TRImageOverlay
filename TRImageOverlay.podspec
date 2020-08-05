#
# Be sure to run `pod lib lint TRImageOverlay.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TRImageOverlay'
  s.version          = '0.1.0'
  s.summary          = 'Framework for generating image overlays with strings.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A framework for generating overlay image based on input string. Many configurations like font or color available for adjustment.'

  s.homepage         = 'https://github.com/truongvinht/TRImageOverlay'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Truong Vinh Tran' => 'truongvinht@gmail.com' }
  s.source           = { :git => 'https://github.com/truongvinht/TRImageOverlay.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/truongvinht'
  
  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  s.source_files = 'TRImageOverlay/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TRImageOverlay' => ['TRImageOverlay/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
