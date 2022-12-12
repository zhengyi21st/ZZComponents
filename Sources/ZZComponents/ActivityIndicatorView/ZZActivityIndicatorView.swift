//
//  ZZActivityIndicatorView.swift
//  ZZComponents
//
//  Created by Ethan on 2022/12/1.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit

/// A material style activity indicator..
///
/// - Note:
///  - Base on:  https://betterprogramming.pub/lets-build-a-circular-loading-indicator-in-swift-5-b06fcdf1260d
open class ZZActivityIndicatorView: UIView {

    /// Convenience initialization.
    /// - Parameters:
    ///   - colors: The stroke colors of shapeLayer.
    ///   - lineWidth: The line width of shapeLayer.
    public convenience init(colors: [UIColor]? = nil, lineWidth: CGFloat? = nil) {
        self.init(frame: .zero)
        if let colors = colors {
            self.colors = colors
        }
        if let lineWidth = lineWidth {
            self.lineWidth = lineWidth
        }
    }

    /// The stroke colors of shapeLayer.
    open var colors: [UIColor] = [{
        let light = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        let dark = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        if #available(iOS 13.0, tvOS 13.0, *) {
            return UIColor(dynamicProvider: { $0.userInterfaceStyle == .dark ? dark : light })
        } else {
            return UIColor(cgColor: light.cgColor)
        }
    }()] {
        didSet {
            updateColors()
        }
    }

    /// The line width of shapeLayer.
    open var lineWidth: CGFloat = 2.5 {
        didSet {
            shapeLayer.lineWidth = lineWidth
        }
    }

    /// The duration of animation.
    public let duration: CFTimeInterval = 1.25

    /// Whether the activity indicator is animating.
    open private(set) var isAnimating: Bool = false

    /// A main layer that draws a circle.
    private lazy var shapeLayer: CAShapeLayer = {
        $0.strokeColor = colors.first?.cgColor
        $0.lineWidth = lineWidth
        $0.fillColor = UIColor.clear.cgColor
        $0.lineCap = .round
        $0.isHidden = true
        return $0
    }(CAShapeLayer())

    /// The stroke colors animation group.
    private lazy var colorAnimation: CAKeyframeAnimation = {
        $0.keyPath = "strokeColor"
        $0.values = colors.map { $0.cgColor }
        $0.duration = duration * Double(colors.count)
        $0.repeatCount = .greatestFiniteMagnitude
        $0.isRemovedOnCompletion = false
        return $0
    }(CAKeyframeAnimation())

    /// The stroke path animation group.
    private lazy var strokeAnimationGroup: CAAnimationGroup = {
        let startAnimation: CABasicAnimation = {
            $0.keyPath = "strokeStart"
            $0.beginTime = 0.25
            $0.fromValue = 0.0
            $0.toValue = 1.0
            $0.duration = duration - 0.25
            $0.timingFunction = .init(name: .easeInEaseOut)
            return $0
        }(CABasicAnimation())
        let endAnimation: CABasicAnimation = {
            $0.keyPath = "strokeEnd"
            $0.beginTime = 0.0
            $0.fromValue = 0.0
            $0.toValue = 1.0
            $0.duration = duration
            $0.timingFunction = .init(name: .easeInEaseOut)
            return $0
        }(CABasicAnimation())
        $0.isRemovedOnCompletion = false
        $0.duration = duration
        $0.repeatDuration = .infinity
        $0.animations = [startAnimation, endAnimation]
        return $0
    }(CAAnimationGroup())

    /// The rotate animation.
    lazy var rotationAnimation: CABasicAnimation = {
        $0.keyPath = "transform.rotation.z"
        $0.fromValue = -CGFloat.pi * 1/2
        $0.toValue = CGFloat.pi * 3/2
        $0.duration = duration * 2
        $0.repeatCount = .greatestFiniteMagnitude
        $0.isRemovedOnCompletion = false
        return $0
    }(CABasicAnimation())

    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
        let path = UIBezierPath(ovalIn: bounds)
        shapeLayer.path = path.cgPath
        if shapeLayer.superlayer != layer {
            layer.addSublayer(shapeLayer)
        }
    }

    open override var intrinsicContentSize: CGSize {
        return .init(width: 24, height: 24)
    }

    /// Add stroke animation for shapeLayer.
    private func addStrokeAnimation() {
        if shapeLayer.animation(forKey: "strokeAnimationGroup") != nil {
            shapeLayer.removeAnimation(forKey: "strokeAnimationGroup")
        }
        if shapeLayer.animation(forKey: "colorAnimation") != nil {
            shapeLayer.removeAnimation(forKey: "colorAnimation")
        }
        shapeLayer.add(strokeAnimationGroup, forKey: "strokeAnimationGroup")
        shapeLayer.add(colorAnimation, forKey: "colorAnimation")
    }

    /// Add rotate animation for layer.
    private func addRotationAnimation() {
        if layer.animation(forKey: "rotate") != nil {
            layer.removeAnimation(forKey: "rotate")
        }
        layer.add(rotationAnimation, forKey: "rotate")
    }

    /// Update the colors for shapeLayer and animations.
    private func updateColors() {
        shapeLayer.strokeColor = colors.first?.cgColor
        colorAnimation.values = colors.map { $0.cgColor }
        colorAnimation.duration = duration * Double(colors.count)
        shapeLayer.removeAnimation(forKey: "colorAnimation")
        shapeLayer.add(colorAnimation, forKey: "colorAnimation")
    }

    /// Starts the animation of the progress indicator.
    open func startAnimating() {
        guard !isAnimating else { return }
        isAnimating = true
        addStrokeAnimation()
        addRotationAnimation()
        shapeLayer.isHidden = false
    }

    /// Stops the animation of the progress indicator.
    open func stopAnimating() {
        guard isAnimating else { return }
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        isAnimating = false
        shapeLayer.isHidden = true
        shapeLayer.removeAllAnimations()
        layer.removeAllAnimations()
        CATransaction.commit()
    }
}
