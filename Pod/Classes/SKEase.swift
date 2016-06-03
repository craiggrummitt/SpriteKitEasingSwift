//
//  SKEase.swift
//
//  Created by CraigGrummitt on 6/08/2014.
//  Copyright (c) 2014 CraigGrummitt. All rights reserved.
//
//  Based on SpriteKit_Easing.m
//  SpriteKit-Easing
//
//  Created by Andrew Eiche on 10/20/13.
//  Copyright (c) 2013 Birdcage Games LLC. All rights reserved.
//
import Foundation
import UIKit
import SpriteKit

public class SKEase {
    public class func getEaseFunction(curve:CurveType, easeType:EaseType)->AHEasingFunction {
        var currentFunction:AHEasingFunction
        switch(curve) {
        case .CurveTypeLinear:
            currentFunction=LinearInterpolation
        case .CurveTypeQuadratic:
            if (easeType == EaseType.EaseTypeIn) {print("YES")}
            currentFunction = (easeType == .EaseTypeIn) ? QuadraticEaseIn : (easeType == .EaseTypeOut) ? QuadraticEaseOut : QuadraticEaseInOut;
        case .CurveTypeCubic:
            currentFunction = (easeType == .EaseTypeIn) ? CubicEaseIn : (easeType == .EaseTypeOut) ? CubicEaseOut : CubicEaseInOut;
        case .CurveTypeQuartic:
            currentFunction = (easeType == .EaseTypeIn) ? QuarticEaseIn : (easeType == .EaseTypeOut) ? QuarticEaseOut : QuarticEaseInOut;
        case .CurveTypeQuintic:
            currentFunction = (easeType == .EaseTypeIn) ? QuinticEaseIn : (easeType == .EaseTypeOut) ? QuinticEaseOut : QuinticEaseInOut;
        case .CurveTypeSine:
            currentFunction = (easeType == .EaseTypeIn) ? SineEaseIn : (easeType == .EaseTypeOut) ? SineEaseOut : SineEaseInOut;
        case .CurveTypeCircular:
            currentFunction = (easeType == .EaseTypeIn) ? CircularEaseIn : (easeType == .EaseTypeOut) ? CircularEaseOut : CircularEaseInOut;
        case .CurveTypeExpo:
            currentFunction = (easeType == .EaseTypeIn) ? ExponentialEaseIn : (easeType == .EaseTypeOut) ? ExponentialEaseOut : ExponentialEaseInOut;
        case .CurveTypeElastic:
            currentFunction = (easeType == .EaseTypeIn) ? ElasticEaseIn : (easeType == .EaseTypeOut) ? ElasticEaseOut : ElasticEaseInOut;
        case .CurveTypeBack:
            currentFunction = (easeType == .EaseTypeIn) ? BackEaseIn : (easeType == .EaseTypeOut) ? BackEaseOut : BackEaseInOut;
        case .CurveTypeBounce:
            currentFunction = (easeType == .EaseTypeIn) ? BounceEaseIn : (easeType == .EaseTypeOut) ? BounceEaseOut : BounceEaseInOut;
        }
        return currentFunction
    }
    public class func createPointTween(start:CGPoint, end:CGPoint, time:NSTimeInterval,easingFunction:AHEasingFunction, setterBlock setter:((SKNode,CGPoint)->Void))->SKAction {
        let action:SKAction = SKAction.customActionWithDuration(time, actionBlock: { (node:SKNode, elapsedTime:CGFloat) -> Void in
            let timeEq = easingFunction(Float(elapsedTime)/Float(time))
            let xValue:CGFloat = start.x + CGFloat(timeEq) * (end.x - start.x)
            let yValue:CGFloat = start.y + CGFloat(timeEq) * (end.y - start.y)
            setter(node,CGPointMake(xValue, yValue))
        })
        return action
    }
    public class func createFloatTween(start:CGFloat, end:CGFloat, time:NSTimeInterval,easingFunction:AHEasingFunction, setterBlock setter:((SKNode,CGFloat)->Void))->SKAction {
        let action:SKAction = SKAction.customActionWithDuration(time, actionBlock: { (node:SKNode, elapsedTime:CGFloat) -> Void in
            let timeEq = easingFunction(Float(elapsedTime)/Float(time))
            let value:CGFloat = start+CGFloat(timeEq) * (end-start)
            setter(node,value)
        })
        return action
    }
    
    //MARK: Move
    /**
    Animate x/y movement
    */
    public class func move(easeFunction curve:CurveType, easeType:EaseType, time:NSTimeInterval, fromPoint from:CGPoint, toPoint to:CGPoint)->SKAction {
        let easingFunction = SKEase.getEaseFunction(curve, easeType: easeType)
        let action = self.createPointTween(from, end: to, time: time, easingFunction: easingFunction) { (node:SKNode, point:CGPoint) -> Void in
            node.position = point
        }
        return action
    }
    //legacy
    public class func moveToWithNode(target:SKNode, easeFunction curve:CurveType, easeType:EaseType, time:NSTimeInterval, toPoint to:CGPoint)->SKAction {
        let easingFunction = SKEase.getEaseFunction(curve, easeType: easeType)
        let startPosition = target.position
        let action = self.createPointTween(CGPointMake(startPosition.x,startPosition.y), end: to, time: time, easingFunction: easingFunction) { (node:SKNode, point:CGPoint) -> Void in
            node.position = point
        }
        return action
    }
    public class func moveFromWithNode(target:SKNode, easeFunction curve:CurveType, easeType:EaseType, time:NSTimeInterval, fromPoint from:CGPoint)->SKAction {
        let easingFunction = SKEase.getEaseFunction(curve, easeType: easeType)
        let startPosition = target.position
        let action = self.createPointTween(from, end: CGPointMake(startPosition.x,startPosition.y), time: time, easingFunction: easingFunction) { (node:SKNode, point:CGPoint) -> Void in
            node.position = point
        }
        return action
    }
    
    //MARK: Scale
    /**
    Animate scale
    */
    public class func scale(easeFunction curve:CurveType, easeType:EaseType, time:NSTimeInterval, fromValue from:CGFloat, toValue to:CGFloat)->SKAction {
        let easingFunction = SKEase.getEaseFunction(curve, easeType: easeType)
        let action = self.createFloatTween(from, end: to, time: time, easingFunction: easingFunction) { (node:SKNode, scale:CGFloat) -> Void in
            node.setScale(scale)
        }
        return action
    }
    //legacy
    public class func scaleToWithNode(target:SKNode, easeFunction curve:CurveType, easeType:EaseType, time:NSTimeInterval, toValue to:CGFloat)->SKAction {
        let easingFunction = SKEase.getEaseFunction(curve, easeType: easeType)
        let action = self.createFloatTween(target.xScale, end: to, time: time, easingFunction: easingFunction) { (node:SKNode, scale:CGFloat) -> Void in
            node.setScale(scale)
        }
        return action
    }
    public class func scaleFromWithNode(target:SKNode, easeFunction curve:CurveType, easeType:EaseType, time:NSTimeInterval, fromValue from:CGFloat)->SKAction {
        let easingFunction = SKEase.getEaseFunction(curve, easeType: easeType)
        let action = self.createFloatTween(from, end: target.xScale, time: time, easingFunction: easingFunction) { (node:SKNode, scale:CGFloat) -> Void in
            node.setScale(scale)
        }
        return action
    }
    
    //MARK: Rotate
    /**
    Animate z rotation
    */
    public class func rotate(easeFunction curve:CurveType, easeType:EaseType, time:NSTimeInterval, fromValue from:CGFloat, toValue to:CGFloat)->SKAction {
        let easingFunction = SKEase.getEaseFunction(curve, easeType: easeType)
        let action = self.createFloatTween(from, end: to, time: time, easingFunction: easingFunction) { (node:SKNode, rotation:CGFloat) -> Void in
            node.zRotation=rotation
        }
        return action
    }
    //legacy
    public class func rotateToWithNode(target:SKNode, easeFunction curve:CurveType, easeType:EaseType, time:NSTimeInterval, toValue to:CGFloat)->SKAction {
        let easingFunction = SKEase.getEaseFunction(curve, easeType: easeType)
        let action = self.createFloatTween(target.zRotation, end: to, time: time, easingFunction: easingFunction) { (node:SKNode, rotation:CGFloat) -> Void in
            node.zRotation=rotation
        }
        return action
    }
    public class func rotateFromWithNode(target:SKNode, easeFunction curve:CurveType, easeType:EaseType, time:NSTimeInterval, fromValue from:CGFloat)->SKAction {
        let easingFunction = SKEase.getEaseFunction(curve, easeType: easeType)
        let action = self.createFloatTween(from, end: target.zRotation, time: time, easingFunction: easingFunction) { (node:SKNode, rotation:CGFloat) -> Void in
            node.zRotation=rotation
        }
        return action
    }
    
    
    //MARK: Fade
    /**
    Animate fade
    */
    public class func fade(easeFunction curve:CurveType, easeType:EaseType, time:NSTimeInterval, fromValue from:CGFloat, toValue to:CGFloat)->SKAction {
        let easingFunction = SKEase.getEaseFunction(curve, easeType: easeType)
        let action = self.createFloatTween(from, end: to, time: time, easingFunction: easingFunction) { (node:SKNode, alpha:CGFloat) -> Void in
            node.alpha=alpha
        }
        return action
    }
    //legacy
    public class func fadeToWithNode(target:SKNode, easeFunction curve:CurveType, easeType:EaseType, time:NSTimeInterval, toValue to:CGFloat)->SKAction {
        let easingFunction = SKEase.getEaseFunction(curve, easeType: easeType)
        let action = self.createFloatTween(target.alpha, end: to, time: time, easingFunction: easingFunction) { (node:SKNode, alpha:CGFloat) -> Void in
            node.alpha=alpha
        }
        return action
    }
    public class func fadeFromWithNode(target:SKNode, easeFunction curve:CurveType, easeType:EaseType, time:NSTimeInterval, fromValue from:CGFloat)->SKAction {
        let easingFunction = SKEase.getEaseFunction(curve, easeType: easeType)
        let action = self.createFloatTween(from, end: target.alpha, time: time, easingFunction: easingFunction) { (node:SKNode, alpha:CGFloat) -> Void in
            node.alpha=alpha
        }
        return action
    }
}
