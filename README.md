SpriteKitEasingSwift
====================

Better Easing for SpriteKit in Swift

This easing library began life as a port of <a href="https://github.com/buddingmonkey">buddingmonkey</a>'s Objective C <a href="https://github.com/buddingmonkey/SpriteKit-Easing">SpriteKit Easing library</a> to Swift.

This library extends upon the basic easing equations available in the SpriteKit framework by Apple.

Sprite Kit Easing makes available the following standard easing equations as SKActions.
* Linear
* Quadratic
* Cubic
* Quartic
* Quintic
* Sine
* Circular
* Expo
* Elastic
* Back
* Bounce
 
![easing.gif](easing.gif)
 
The SKEase functions return an SKAction that performs the ease. You can then run the SKAction in the same manner you would any other SKAction in SpriteKit.

```Swift
//eg an SKLabelNode(which extends SKNode) flies in from the right with an elastic tween:
let titleLabel = SKLabelNode(fontNamed:"Avenir-Light")
titleLabel.text = "Hello world"
titleLabel.fontSize = 65
titleLabel.fontColor = UIColor.blackColor()
titleLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
self.addChild(titleLabel)
titleLabel.runAction(SKEase.moveFrom(withNode:titleLabel, easeFunction: .CurveTypeElastic, easeType: .EaseTypeOut, time: 1.5, fromVector: CGVectorMake(frame.width+titleLabel.frame.width/2, titleLabel.position.y)))
```

Again, credit and thanks go to <a href="https://github.com/buddingmonkey/SpriteKit-Easing">SpriteKitEasing</a> and <a href="https://github.com/warrenm/AHEasing">AHEasing</a>.

API documentation can be found at [cocoadocs](http://cocoadocs.org/docsets/SpriteKitEasingSwift/).

## Installation

**via CocoaPods**

SpriteKitEasingSwift is available through [CocoaPods](https://cocoapods.org/pods/SpriteKitEasingSwift). To install
it, add the following to your Podfile: (Static Swift frameworks require iOS 8)

```ruby
platform :ios, '8.0'
use_frameworks!

target "MyApp" do
	pod 'SpriteKitEasingSwift'
end
```

Don't forget to import the Pod where you would like to use it:

```Swift
import SpriteKitEasingSwift
```

**via Carthage**

You can use [Carthage](https://github.com/Carthage/Carthage) to install SwiftyJSON by adding it to your Cartfile:

```
github "craiggrummitt/SpriteKitEasingSwift"
```

Don't forget to import the Pod where you would like to use it:

```Swift
import SpriteKitEasingSwift
```

***via Github:***

Clone the project at Github ([https://github.com/craiggrummitt/SpriteKitEasingSwift](https://github.com/craiggrummitt/SpriteKitEasingSwift)). You will find an example project there as well. To use the framework either:

1. Drag the Pod/Classes folder into your project.
2. Import the frameworks in the _Archive folder. Follow the steps under 'Adding Frameworks to an App' [here](https://kodmunki.wordpress.com/2015/09/22/ios-9-universal-cocoa-touch-frameworks/comment-page-1/#comment-201).
