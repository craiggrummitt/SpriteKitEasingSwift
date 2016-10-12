//
//  ViewController.swift
//  SpriteKitEasingSwift
//
//  Created by Craig Grummitt on 02/10/2016.
//  Copyright (c) 2016 Craig Grummitt. All rights reserved.
//

import UIKit
import SpriteKit
import SpriteKitEasingSwift

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillLayoutSubviews() {
        if let skview = self.view as? SKView {
            let scene = SKScene(size: CGSize(width: skview.bounds.width, height: skview.bounds.height))
            
            scene.scaleMode = .aspectFill
            
            skview.presentScene(scene)
            
            
            let circle = SKShapeNode(circleOfRadius: 20)
            circle.fillColor = UIColor.blue
            circle.lineWidth = 0
            circle.position = CGPoint(x: 0, y: 0)
            scene.addChild(circle)
            animateShape(circle)

            let circle2 = SKShapeNode(circleOfRadius: 10)
            circle2.fillColor = UIColor.yellow
            circle2.lineWidth = 0
            circle2.position = CGPoint(x: 0, y: 0)
            scene.addChild(circle2)
            animateShape(circle2)
            
            
            let rect = SKShapeNode(rectOf: CGSize(width: 15, height: 15))
            rect.fillColor = UIColor.green
            rect.lineWidth = 0
            rect.position = CGPoint(x: 0, y: 0)
            scene.addChild(rect)
            animateShape(rect)
        }
    }
    func animateShape(_ shape:SKShapeNode) {
        if let skview = self.view as? SKView {
            let randomPoint = CGPoint(x:Int(arc4random()%UInt32(skview.bounds.width)),y:Int(arc4random()%UInt32(skview.bounds.height)))
            shape.run(SKEase.move(easeFunction: .curveTypeElastic, easeType: EaseType.easeTypeOut, time: 1.5, from: shape.position , to: randomPoint), completion: { () -> Void in
                self.animateShape(shape)
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

