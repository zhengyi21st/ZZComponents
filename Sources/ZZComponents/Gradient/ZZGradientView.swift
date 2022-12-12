//
//  ZZGradientView.swift
//  ZZComponents
//
//  Created by Ethan on 2022/9/22.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit

open class ZZGradientView: UIView {

    public lazy var gradientLayer = CAGradientLayer()

    public var colors: [UIColor?] = [] {
        didSet {
            gradientLayer.colors = colors.compactMap { $0?.cgColor }
            gradientLayer.layoutIfNeeded()
        }
    }

    public var locations: [NSNumber]? {
        didSet {
            gradientLayer.locations = locations
            gradientLayer.layoutIfNeeded()
        }
    }

    public var startPoint: CGPoint = CGPoint(x: 0.5, y: 0) {
        didSet {
            gradientLayer.startPoint = startPoint
            gradientLayer.layoutIfNeeded()
        }
    }

    public var endPoint: CGPoint = CGPoint(x: 0.5, y: 1) {
        didSet {
            gradientLayer.endPoint = endPoint
            gradientLayer.layoutIfNeeded()
        }
    }

    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradientLayer.colors = colors.compactMap { $0?.cgColor }
        CATransaction.commit()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradientLayer.frame = bounds
        CATransaction.commit()
    }

    private func commonInit() {
        clipsToBounds = true
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
