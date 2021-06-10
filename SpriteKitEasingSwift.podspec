#
# Be sure to run `pod lib lint SpriteKitEasingSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'SpriteKitEasingSwift'
s.version          = '0.15.0'
s.summary          = 'Extends upon the basic easing equations available in the SpriteKit framework by Apple.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
Better Easing for SpriteKit in Swift
    This easing library began life as a port of buddingmonkey's Objective C SpriteKit Easing library to Swift.
    This library extends upon the basic easing equations available in the SpriteKit framework by Apple.
DESC

s.homepage         = 'https://github.com/craiggrummitt/SpriteKitEasingSwift'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { "Craig Grummitt" => "craiggrummitt@gmail.com" }
s.source           = { :git => 'https://github.com/craiggrummitt/SpriteKitEasingSwift.git', :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/craiggrummitt'

s.ios.deployment_target = '9.0'

s.source_files = 'SpriteKitEasingSwift/Classes/**/*'

# s.resource_bundles = {
#   'SpriteKitEasingSwift' => ['SpriteKitEasingSwift/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
# s.dependency 'AFNetworking', '~> 2.3'
end

