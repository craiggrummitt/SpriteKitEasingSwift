// https://github.com/Quick/Quick

import Quick
import Nimble
import SpriteKitEasingSwift
import SpriteKit
//come back to this, tests not working due to CocoaPods glitch
class TableOfContentsSpec: QuickSpec {
  var node = SKNode()
    override func spec() {
        describe("Test Easing") {
            it("can ease a float") {
              var easeMe:CGFloat = 0
              let easingFunction = SKEase.getEaseFunction(.curveTypeLinear, easeType: .easeTypeIn)
              let action = SKEase.createFloatTween(0, end: 1, time: 0.3, easingFunction: easingFunction) { (node:SKNode, easeValue:CGFloat) -> Void in
                easeMe = easeValue
              }
              self.node.run(action)
              waitUntil { done in
                Thread.sleep(forTimeInterval: 0.5)
                expect(easeMe) == 1.0
                done()
              }
            }
        }
    }
}

