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
  var curveTypes:[CurveType] = [.curveTypeLinear, .curveTypeQuadratic, .curveTypeCubic, .curveTypeQuartic,
                                .curveTypeQuintic, .curveTypeSine, .curveTypeCircular, .curveTypeExpo,
                                .curveTypeElastic, .curveTypeBack, .curveTypeBounce]
  var colors:[UIColor]!
  var easingTypes:[EaseType] = [.easeTypeIn, .easeTypeOut, .easeTypeInOut]
  var scene:SKScene!
  var circles:[SKShapeNode] = []
  var circleDiameter:CGFloat!
  var skview:SKView!
  let circlePadding:CGFloat = 5
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillLayoutSubviews() {
    //set up SKView
    guard let skview = self.view as? SKView else {return}
    self.skview = skview
    skview.showsFPS = true
    skview.showsNodeCount = true
    skview.backgroundColor = .white
    
    //set up SKScene
    scene = SKScene(size: CGSize(width: skview.bounds.width, height: skview.bounds.height))
    scene.scaleMode = .aspectFill
    scene.backgroundColor = .white
    skview.presentScene(scene)
    
    circleDiameter = ((skview.bounds.height - circlePadding) / CGFloat(curveTypes.count)) - circlePadding
    for i in 0..<curveTypes.count {
      //display a label
      let label = SKLabelNode(fontNamed: "AvenirNext-Regular")
      label.fontColor = .lightGray
      label.position = CGPoint(x: skview.bounds.width / 2, y: getYPos(with: CGFloat(i)))
      label.text = String(describing:curveTypes[i])
      scene.addChild(label)
      animateLabelColor(label, isReturning: true)
      //draw circle
      let circle = getCircle(i)
      circles.append(circle)
      scene.addChild(circle)
      animateShape(circle, circleNo: i, isReturning: true)
    }
  }
  func getCircle(_ circleNo:Int)->SKShapeNode {
    let circleNoF = CGFloat(circleNo)
    let circle = SKShapeNode(circleOfRadius: circleDiameter / 2)
    circle.fillColor = UIColor(hue: 1.0 / circleNoF, saturation: 1, brightness: 1, alpha: 1)
    circle.lineWidth = 0
    circle.position = CGPoint(x: circleDiameter, y: getYPos(with: circleNoF))
    return circle
  }
  func getYPos(with circleNo:CGFloat)->CGFloat {
    return((circleDiameter * 0.5) + ((circlePadding + circleDiameter) * circleNo))
  }
  func animateShape(_ shape:SKShapeNode, circleNo:Int, isReturning:Bool) {
    let destPoint = CGPoint(x: isReturning ? circleDiameter : skview.bounds.width - circleDiameter,
                            y: shape.position.y)
    shape.run(SKEase.move(easeFunction: curveTypes[circleNo],
                          easeType: EaseType.easeTypeOut,
                          time: 1.5,
                          from: shape.position ,
                          to: destPoint),
              completion: { () -> Void in
                self.animateShape(shape, circleNo: circleNo, isReturning: !isReturning)
    })
  }
  func animateLabelColor(_ label:SKLabelNode, isReturning:Bool) {
    let destColor = isReturning ? UIColor.lightGray : UIColor.red
    label.run(SKEase.tweenLabelColor(easeFunction: .curveTypeLinear,
                          easeType: EaseType.easeTypeOut,
                          time: 1.5,
                          from: label.fontColor!,
                          to: destColor),
              completion: { () -> Void in
                self.animateLabelColor(label, isReturning: !isReturning)
    })
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  override var prefersStatusBarHidden: Bool {
    return true
  }
}

