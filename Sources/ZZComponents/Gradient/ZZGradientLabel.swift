//
//  ZZGradientLabel.swift
//  ZZComponents
//
//  Created by Ethan on 2022/11/1.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit

open class ZZGradientLabel: UILabel {
    
    public enum GradientDirection : Int {
        case vertical = 0
        case horizontal = 1
    }
    
    open var direction: GradientDirection = .horizontal {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    open var colors: [UIColor?] = [] {
        didSet {
            layer.setNeedsDisplay()
        }
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        layer.setNeedsDisplay()
        CATransaction.commit()
    }
    
    open override func drawText(in rect: CGRect) {
        if let gradientColor = drawGradientColor(in: rect, colors: colors.compactMap { $0?.cgColor }) {
            self.textColor = gradientColor
        }
        super.drawText(in: rect)
    }
    
    func drawGradientColor(in rect: CGRect, colors: [CGColor]) -> UIColor? {
        let currentContext = UIGraphicsGetCurrentContext()
        currentContext?.saveGState()
        defer { currentContext?.restoreGState() }
        
        let size = rect.size
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors as CFArray, locations: nil) else { return nil }
        let context = UIGraphicsGetCurrentContext()
        let startPoint = direction == .horizontal ? CGPoint(x: 0, y: size.height / 2) : CGPoint(x: size.width / 2, y: 0)
        let endPoint = direction == .horizontal ? CGPoint(x: size.width, y: size.height / 2) : CGPoint(x: size.width / 2, y: size.height)
        context?.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = gradientImage else { return nil }
        return UIColor(patternImage: image)
    }
    
}
