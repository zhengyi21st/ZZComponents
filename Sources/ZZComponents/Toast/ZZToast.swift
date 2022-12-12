//
//  ZZToast.swift
//  ZZComponents
//
//  Created by Ethan on 2022/9/26.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit

open class ZZToast: UIView {

    public enum Position {
        case top
        case center
        case bottom
    }

    open var backgroundView: UIView = {
        $0.backgroundColor = .clear
        return $0
    }(UIView())

    open var contentView: UIView = {
        $0.backgroundColor = ZZColor.create(
            light: ZZColor.rgba(red: 44, green: 44, blue: 46, alpha: 0.9),
            dark: ZZColor.rgba(red: 28, green: 28, blue: 28, alpha: 0.9)
        )
        $0.layer.cornerRadius = 8
        return $0
    }(UIView())

    open var textLabel: UILabel = {
        $0.font = ZZFont.subheadline()
        $0.textColor = ZZColor.systemWhite
        $0.numberOfLines = 0
        $0.textAlignment = .center
        return $0
    }(UILabel())

    public var position: Position = .center {
        didSet {
            if position == .top {
                contentTopConstraint?.isActive = true
                contentCenterConstraint?.isActive = false
                contentBottomConstraint?.isActive = false
            } else if position == .center {
                contentTopConstraint?.isActive = false
                contentCenterConstraint?.isActive = true
                contentBottomConstraint?.isActive = false
            } else if position == .bottom {
                contentTopConstraint?.isActive = false
                contentCenterConstraint?.isActive = false
                contentBottomConstraint?.isActive = true
            }
        }
    }

    var contentTopConstraint: NSLayoutConstraint?
    var contentCenterConstraint: NSLayoutConstraint?
    var contentBottomConstraint: NSLayoutConstraint?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        let contentTopConstraint = contentView.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor, constant: 20)
        let contentBottomConstraint = contentView.bottomAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        let contentCenterConstraint = contentView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
        addSubview(backgroundView)
        addSubview(contentView)
        contentView.addSubview(textLabel)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // add backgroundView constraints
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: rightAnchor),
            // add contentView constraints
            contentView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            contentCenterConstraint,
            contentView.widthAnchor.constraint(lessThanOrEqualTo: backgroundView.widthAnchor, constant: -32),
            // add textLabel constraints
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            textLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            textLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])
        self.contentTopConstraint = contentTopConstraint
        self.contentBottomConstraint = contentBottomConstraint
        self.contentCenterConstraint = contentCenterConstraint
    }

    @discardableResult open func show(at view: UIView, animated: Bool = false) -> ZZToast {
        if self.superview != view {
            view.addSubview(self)
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: view.leftAnchor),
                rightAnchor.constraint(equalTo: view.rightAnchor),
                bottomAnchor.constraint(equalTo: view.bottomAnchor),
                topAnchor.constraint(equalTo: view.topAnchor)
            ])
            if animated {
                self.alpha = 0
                UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction, .curveEaseOut], animations: {
                    self.alpha = 1
                })
            }
        }
        return self
    }

    open func hide(animated: Bool = true, withHideDelay delay: TimeInterval = 0) {
        let animations = {
            self.alpha = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
            if animated {
                UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
                    self.alpha = 0
                }, completion: { _ in
                    self.removeFromSuperview()
                })
            } else {
                animations()
                self.removeFromSuperview()
            }
        })
    }

    @discardableResult open class func show(_ text: String? = nil, at view: UIView? = nil, position: Position = .center, offset: CGFloat? = nil, interaction: Bool = false, withHideDelay delay: TimeInterval? = 3) -> Self {
        let toast = self.init()
        toast.textLabel.text = text
        toast.isUserInteractionEnabled = interaction
        guard let view = view ?? UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return toast }
        view.subviews.forEach {
            if $0 is ZZToast {
                $0.removeFromSuperview()
            }
        }
        toast.position = position
        if position == .top, let offset = offset {
            toast.contentTopConstraint?.constant = offset
        } else if position == .center, let offset = offset {
            toast.contentCenterConstraint?.constant = offset
        } else if position == .bottom, let offset = offset {
            toast.contentBottomConstraint?.constant = offset
        }
        toast.show(at: view, animated: false)
        if let delay = delay {
            toast.hide(animated: true, withHideDelay: delay)
        }
        return toast
    }

    open class func hideAll(at view: UIView? = nil, animated: Bool = false) {
        guard let view = view ?? UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        view.subviews.forEach {
            if let subToast = $0 as? ZZToast {
                subToast.hide(animated: false)
            }
        }
    }
}
