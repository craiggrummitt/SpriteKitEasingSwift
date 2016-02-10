SpriteKitEasingSwift
====================

Better Easing for SpriteKit in Swift

This easing library began life as a port of <a href="https://github.com/buddingmonkey">buddingmonkey</a>'s Objective C <a href="https://github.com/buddingmonkey/SpriteKit-Easing">SpriteKit Easing library</a> to Swift.

This library extends upon the basic easing equations available in the SpriteKit framework by Apple.

You have two ways to introduce SpriteKitEasing into your project. 

1. You can just drag the SpriteKitEasingSwift folder into your project.
2. You can add the frameworks in the `_Archive` folder into your project. Follow the instructions [here](https://kodmunki.wordpress.com/2015/09/22/ios-9-universal-cocoa-touch-frameworks/comment-page-1/#comment-201) under the heading "Adding Frameworks to an App".

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
 
The SKEase functions return an SKAction that performs the ease. You can then run the SKAction in the same manner you would any other SKAction in SpriteKit.

```Swift
//eg an SKLabelNode(which extends SKNode) flies in from the right with an elastic tween:
let titleLabel = SKLabelNode(fontNamed:"Avenir-Light")
titleLabel.text = "Hello world"
titleLabel.fontSize = 65
titleLabel.fontColor = UIColor.blackColor()
titleLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
self.addChild(titleLabel)
titleLabel.runAction(SKEase.moveFromWithNode(titleLabel, easeFunction: .CurveTypeElastic, easeType: .EaseTypeOut, time: 1.5, fromVector: CGVectorMake(frame.width+titleLabel.frame.width/2, titleLabel.position.y)))
```
Again, credit and thanks go to <a href="https://github.com/buddingmonkey/SpriteKit-Easing">SpriteKitEasing</a> and <a href="https://github.com/warrenm/AHEasing">AHEasing</a>.
