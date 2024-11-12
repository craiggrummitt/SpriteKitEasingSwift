//
//  SpriteKitEasingSwiftTests.swift
//  SpriteKitEasingSwift
//
//  Created by Dmitry Shlepkin on 11/7/24.
//

import XCTest
import SpriteKit
@testable import SpriteKitEasingSwift

final class SpriteKitEasingSwiftTests: XCTestCase {
    
    func testEasing() throws {
        var easeMe: CGFloat = 0
        let easingFunction = SKEase.getEaseFunction(.curveTypeLinear, easeType: .easeTypeIn)
        let action = SKEase.createFloatTween(0, end: 1, time: 0.3, easingFunction: easingFunction) { (node: SKNode, easeValue: CGFloat) -> Void in
            easeMe = easeValue
        }
    
        let scene = SKScene()
        let view = SKView()
        let node = SKNode()
        
        view.presentScene(scene)
        scene.addChild(node)
        node.run(action)
    
        let exp = expectation(description: "Test after 3 second")
        let result = XCTWaiter.wait(for: [exp], timeout: 3.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(easeMe == 1.0)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
}
