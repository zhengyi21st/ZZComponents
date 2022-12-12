//
//  ZZColor.swift
//  ZZComponents
//
//  Created by Ethan on 2022/9/22.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit

open class ZZButton: UIButton {

    public struct ButtonStyle: OptionSet {
        public let rawValue: Int
        public static let touchHighlight = ButtonStyle(rawValue: 1 << 0)
        public static let touchOpacity = ButtonStyle(rawValue: 1 << 1)
        public static let touchBounce = ButtonStyle(rawValue: 1 << 2)
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    private(set) public var activityIndicatorView: UIActivityIndicatorView?

    private(set) public var touchHighlightView: UIView?

    public var touchHighlightColor = UIColor(white: 0, alpha: 0.47) {
        didSet {
            touchHighlightView?.backgroundColor = touchHighlightColor
        }
    }

    public var touchOpacity: CGFloat = 0.8

    public var isLoading: Bool = false {
        didSet {
            titleLabel?.layer.transform = isLoading ? CATransform3DMakeScale(0.0, 0.0, 0.0) : CATransform3DMakeScale(1, 1, 1)
            imageView?.layer.transform = isLoading ? CATransform3DMakeScale(0.0, 0.0, 0.0) : CATransform3DMakeScale(1, 1, 1)
            if isLoading && activityIndicatorView == nil {
                let activityIndicatorView = UIActivityIndicatorView()
                addSubview(activityIndicatorView)
                activityIndicatorView.color = titleColor(for: .normal)
                activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
                    activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
                ])
                activityIndicatorView.startAnimating()
                self.activityIndicatorView = activityIndicatorView
            } else if !isLoading && activityIndicatorView?.superview == self {
                activityIndicatorView?.stopAnimating()
                activityIndicatorView = nil
                activityIndicatorView?.removeFromSuperview()
            }
            isUserInteractionEnabled = isLoading ? false : _oldIsUserInteractionEnabled
        }
    }

    public var style: ZZButton.ButtonStyle = [] {
        didSet {
            handleSetStyle()
            layoutSubviews()
        }
    }

    private var _oldIsUserInteractionEnabled: Bool = true

    private var _oldAlpha: CGFloat?

    private var _oldBackgroundColor: UIColor?

    open override var isUserInteractionEnabled: Bool {
        didSet {
            if !isLoading {
                _oldIsUserInteractionEnabled = isUserInteractionEnabled
            }
        }
    }

    private var insetHorizontalAmount: CGFloat = 0 {
        didSet {
            contentEdgeInsets = .init(top: contentEdgeInsets.top, left: contentEdgeInsets.left, bottom: contentEdgeInsets.bottom, right: contentEdgeInsets.right)
        }
    }

    open override var contentEdgeInsets: UIEdgeInsets {
        didSet {
            super.contentEdgeInsets = UIEdgeInsets(top: contentEdgeInsets.top, left: contentEdgeInsets.left + insetHorizontalAmount, bottom: contentEdgeInsets.bottom, right: contentEdgeInsets.right + insetHorizontalAmount)
        }
    }

    open override func setTitleColor(_ color: UIColor?, for state: UIControl.State) {
        super.setTitleColor(color, for: state)
        activityIndicatorView?.color = color
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        touchHighlightView?.layer.cornerRadius = layer.cornerRadius
    }

    public convenience init(type: UIButton.ButtonType? = nil, style: ZZButton.ButtonStyle) {
        if let type = type {
            self.init(type: type)
        } else {
            self.init()
        }
        self.style = style
        self.handleSetStyle()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        adjustsImageWhenHighlighted = false
        addTarget(self, action: #selector(handleTouchDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(handleTouchUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }

    private func handleSetStyle() {
        if style.contains(.touchHighlight) && self.touchHighlightView == nil {
            let touchHighlightView: UIView = {
                $0.alpha = 0
                $0.isUserInteractionEnabled = false
                $0.backgroundColor = self.touchHighlightColor
                return $0
            }(UIView())
            self.addSubview(touchHighlightView)
            touchHighlightView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                touchHighlightView.topAnchor.constraint(equalTo: topAnchor),
                touchHighlightView.leftAnchor.constraint(equalTo: leftAnchor),
                touchHighlightView.rightAnchor.constraint(equalTo: rightAnchor),
                touchHighlightView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            self.touchHighlightView = touchHighlightView
        } else if !style.contains(.touchHighlight) && self.touchHighlightView != nil {
            self.touchHighlightView?.removeFromSuperview()
            self.touchHighlightView = nil
        }
    }

    @objc private func handleTouchDown() {
        if style.contains(.touchOpacity) {
            _oldAlpha = alpha
            alpha = touchOpacity
        }
        if style.contains(.touchHighlight) {
            self.touchHighlightView?.alpha = 1
        }
        if style.contains(.touchBounce) {
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: CGFloat(1), initialSpringVelocity: CGFloat(25.0), options: [.curveEaseOut, .allowUserInteraction], animations: {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            })
        }
    }

    @objc private func handleTouchUp() {
        if style.contains(.touchOpacity) {
            UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction], animations: {
                if let _oldAlpha = self._oldAlpha {
                    self.alpha = _oldAlpha
                }
            })
        }
        if style.contains(.touchHighlight) {
            UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction], animations: {
                self.touchHighlightView?.alpha = 0
            })
        }
        if style.contains(.touchBounce) {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: CGFloat(1), initialSpringVelocity: CGFloat(10.0), options: [.curveEaseIn, .allowUserInteraction], animations: {
                self.transform = CGAffineTransform.identity
            })
        }
    }

    public func setLeftImage(_ image: UIImage?, spacing: CGFloat = 0, for state: UIControl.State) {
        setImage(image, for: state)
        insetHorizontalAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetHorizontalAmount, bottom: 0, right: insetHorizontalAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetHorizontalAmount, bottom: 0, right: -insetHorizontalAmount)
    }

    public func setRightImage(_ image: UIImage?, spacing: CGFloat = 0, for state: UIControl.State) {
        setImage(image, for: state)
        semanticContentAttribute = .forceRightToLeft
        insetHorizontalAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: insetHorizontalAmount, bottom: 0, right: -insetHorizontalAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -insetHorizontalAmount, bottom: 0, right: insetHorizontalAmount)
    }
}
