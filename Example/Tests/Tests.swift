// https://github.com/Quick/Quick

import Quick
import Nimble
import SpriteKitEasingSwift

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("these will fail") {

            it("can do maths") {
                expect(1) == 2
            }

            it("can read") {
                expect("number") == "string"
            }

            it("will eventually fail") {
                expect("time").toEventually( equal("done") )
            }
            
            context("these will pass") {

                it("can do maths") {
                    expect(23) == 23
                }

                it("can read") {
                    expect("🐮") == "🐮"
                }

                it("will eventually pass") {
                    var time = "passing"

                    DispatchQueue.main.async {
                        time = "done"
                    }

                    waitUntil { done in
                        Thread.sleep(forTimeInterval: 0.5)
                        expect(time) == "done"

                        done()
                    }
                }
            }
        }
    }
}
/*
 // https://github.com/Quick/Quick
 
 import Quick
 import Nimble
 import SpriteKitEasingSwift
 import SpriteKit
 
 class TableOfContentsSpec: QuickSpec {
 let scene = SKScene()
 var easingVar:CGFloat = 0
 override func spec() {
 
 
 describe("Check easing scale") {
 it("will eventually pass") {
 
 let easingFunction = SKEase.getEaseFunction(.curveTypeElastic, easeType: .easeTypeInOut)
 let action = SKEase.createFloatTween(0, end: 100, time: 0.4, easingFunction: easingFunction) { (node:SKNode, variableToEase:CGFloat) -> Void in
 print(variableToEase)
 self.easingVar = variableToEase
 }
 self.scene.run(action)
 waitUntil { done in
 Thread.sleep(forTimeInterval: 0.5)
 expect(self.easingVar) == 100
 done()
 }
 }
 }
 }
 }
 
 */
