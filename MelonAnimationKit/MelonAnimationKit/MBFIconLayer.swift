//
//  MBFIconLayer.swift
//  MelonAnimationKit
//
//  Created by Tomasz Popis on 29/02/16.
//  Copyright © 2016 Melon-IT. All rights reserved.
//

import UIKit

public enum MBFIconHorizontalAligmentType: Int {
  case Left
  case Center
  case Right
  
  public init() {
    self = Center
  }
}

public enum MBFIconVerticalAligmentType: Int {
  case Top
  case Center
  case Bottom
  
  public init() {
    self = Center
  }
}

public class MBFIconLayer: CAShapeLayer {
  
  public var color = UIColor.whiteColor()
  public var offset = UIOffset()
  public var factor = CGFloat(1)
  public var containerFrame = CGRectZero
  
  public var aligment:(horizontal: MBFIconHorizontalAligmentType, vertical: MBFIconVerticalAligmentType) = (MBFIconHorizontalAligmentType(),MBFIconVerticalAligmentType())
  
  public  override init() {
    
    super.init()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    
    super.init(coder: aDecoder)
  }
  
  public init(width: CGFloat, factor: CGFloat, color: UIColor) {
    self.factor = factor
    self.color = color
    
    super.init()
    
    self.frame = CGRectMake(0, 0, width, width*factor)
  }
  
  public func align() {
    
    var frame = self.frame
    
    switch self.aligment.horizontal {
    case MBFIconHorizontalAligmentType.Left:
      break
      
    case MBFIconHorizontalAligmentType.Center:
      frame.origin.x = self.containerFrame.midX - frame.midX
      break
      
    case MBFIconHorizontalAligmentType.Right:
      frame.origin.x = self.containerFrame.maxX - frame.maxX
      break
    }
    
    switch self.aligment.vertical {
    case MBFIconVerticalAligmentType.Top:
      break
      
    case MBFIconVerticalAligmentType.Center:
      frame.origin.y = self.containerFrame.midY - frame.midY
      break
      
    case MBFIconVerticalAligmentType.Bottom:
      frame.origin.y = self.containerFrame.maxY - frame.maxY
      break
    }
    
    frame.origin.x += self.offset.horizontal
    frame.origin.y += self.offset.vertical
    
    self.frame = frame
  }
}
