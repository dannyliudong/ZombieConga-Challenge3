//
//  MyUtils.swift
//  ZombieConga
//
//  Created by Main Account on 10/22/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import Foundation
import CoreGraphics

func + (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func += ( left: inout CGPoint, right: CGPoint) {
  left = left + right
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func -= ( left: inout CGPoint, right: CGPoint) {
  left = left - right
}

func * (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x * right.x, y: left.y * right.y)
}

func *= ( left: inout CGPoint, right: CGPoint) {
  left = left * right
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func *= ( point: inout CGPoint, scalar: CGFloat) {
  point = point * scalar
}

func / (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x / right.x, y: left.y / right.y)
}

func /= ( left: inout CGPoint, right: CGPoint) {
  left = left / right
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

func /= ( point: inout CGPoint, scalar: CGFloat) {
  point = point / scalar
}

#if !(arch(x86_64) || arch(arm64))
func atan2(y: CGFloat, x: CGFloat) -> CGFloat {
  return CGFloat(atan2f(Float(y), Float(x)))
}

func sqrt(a: CGFloat) -> CGFloat {
  return CGFloat(sqrtf(Float(a)))
}
#endif

extension CGPoint {
  
  func length() -> CGFloat {
    return sqrt(x*x + y*y)
  }
  
  func normalized() -> CGPoint {
    return self / length()
  }
  
  var angle: CGFloat {
    return atan2(y, x)
  }
}

let π = CGFloat(M_PI)

func shortestAngleBetween(angle1: CGFloat, 
                          angle2: CGFloat) -> CGFloat {
  let twoπ = π * 2.0
  var angle = CGFloat(Int((angle2 - angle1)) % Int(twoπ))
    
  if (angle >= π) {
    angle = angle - twoπ
  }
  if (angle <= -π) {
    angle = angle + twoπ
  }
  return angle
}

extension CGFloat {
  func sign() -> CGFloat {
    return (self >= 0.0) ? 1.0 : -1.0
  }
}
