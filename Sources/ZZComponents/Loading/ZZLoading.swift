//
//  ZZLoading.swift
//  ZZComponents
//
//  Created by Ethan on 2022/9/26.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit

open class ZZLoading: UIView {

    open var backgroundView: UIView = {
        $0.backgroundColor = .clear
        return $0
    }(UIView())

    open var contentView: UIView = {
        $0.backgroundColor = ZZColor.create(
            light: ZZColor.rgba(red: 44, green: 44, blue: 46, alpha: 1),
            dark: ZZColor.rgba(red: 28, green: 28, blue: 28, alpha: 1)
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

    open var activityIndicatorView: UIActivityIndicatorView = {
        $0.color = ZZColor.systemWhite
        $0.startAnimating()
        return $0
    }(UIActivityIndicatorView(style: .whiteLarge))

    var activityIndicatorBottomConstraint: NSLayoutConstraint?

    var textBottomConstraint: NSLayoutConstraint?

    open override func layoutSubviews() {
        super.layoutSubviews()
        if textLabel.text?.isEmpty == false && textBottomConstraint?.isActive != true {
            if activityIndicatorBottomConstraint?.isActive == true {
                activityIndicatorBottomConstraint?.isActive = false
            }
            textBottomConstraint?.isActive = true
        } else if textLabel.text?.isEmpty != false && activityIndicatorBottomConstraint?.isActive != true {
            if textBottomConstraint?.isActive == true {
                textBottomConstraint?.isActive = false
            }
            activityIndicatorBottomConstraint?.isActive = true
        }
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
        let activityIndicatorBottomConstraint = activityIndicatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        let textBottomConstraint = textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        addSubview(backgroundView)
        addSubview(contentView)
        contentView.addSubview(activityIndicatorView)
        contentView.addSubview(textLabel)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // add backgroundView constraints
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: rightAnchor),
            // add contentView constraints
            contentView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            contentView.widthAnchor.constraint(greaterThanOrEqualTo: contentView.heightAnchor),
            contentView.widthAnchor.constraint(lessThanOrEqualTo: backgroundView.widthAnchor, constant: -32),
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 84),
            // add activityIndicatorView constraints
            activityIndicatorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            activityIndicatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicatorView.widthAnchor.constraint(equalTo: activityIndicatorView.heightAnchor),
            activityIndicatorView.heightAnchor.constraint(equalTo: activityIndicatorView.widthAnchor),
            activityIndicatorBottomConstraint,
            // add textLabel constraints
            textLabel.topAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor, constant: 8),
            textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            textLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            textLabel.widthAnchor.constraint(greaterThanOrEqualTo: activityIndicatorView.widthAnchor)
        ])
        self.activityIndicatorBottomConstraint = activityIndicatorBottomConstraint
        self.textBottomConstraint = textBottomConstraint
    }

    @discardableResult open func show(at view: UIView, animated: Bool = false) -> ZZLoading {
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

    @discardableResult open class func show(_ text: String? = nil, at view: UIView? = nil, animated: Bool = true, interaction: Bool = true, withHideDelay delay: TimeInterval? = nil) -> ZZLoading {
        let loading = ZZLoading()
        loading.textLabel.text = text
        loading.isUserInteractionEnabled = interaction
        guard let view = view ?? UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return loading }
        view.subviews.forEach {
            if $0 is ZZLoading {
                $0.removeFromSuperview()
            }
        }
        loading.show(at: view, animated: false)
        if let delay = delay {
            loading.hide(animated: true, withHideDelay: delay)
        }
        return loading
    }

    open class func hideAll(at view: UIView? = nil, animated: Bool = false) {
        guard let view = view ?? UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        view.subviews.forEach {
            if let subLoading = $0 as? ZZLoading {
                subLoading.hide(animated: false)
            }
        }
    }
}
