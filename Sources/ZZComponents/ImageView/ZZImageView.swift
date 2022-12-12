//
//  ZZImageView.swift
//  ZZComponents
//
//  Created by Ethan on 2022/9/28.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit
import Kingfisher

open class ZZImageView: UIImageView {

    private var defaultImageView: UIImageView = {
        $0.isUserInteractionEnabled = false
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())

    public var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    public var isRounded: Bool = false {
        didSet {
            layoutSubviews()
        }
    }

    public var defaultImage: UIImage? {
        didSet {
            defaultImageView.image = defaultImage
            layoutSubviews()
        }
    }

    open override var image: UIImage? {
        didSet {
            defaultImageView.isHidden = image != nil
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public override init(image: UIImage?) {
        super.init(image: image)
        commonInit()
    }

    public override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        commonInit()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    open func commonInit() {
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }

    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layer.borderColor = borderColor?.cgColor
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        if isRounded {
            layer.cornerRadius = bounds.height / 2
        }
        defaultImageView.frame = bounds
        if defaultImageView.image != nil, defaultImageView.superview != self {
            addSubview(defaultImageView)
        } else if defaultImageView.image == nil, defaultImageView.superview == self {
            defaultImageView.removeFromSuperview()
        }
    }

    public func setImage(url: URL?, targetSize: CGSize? = nil, animated: Bool = true, completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) {
        var options: KingfisherOptionsInfo = []
        if animated == true {
            options.append(.transition(.fade(0.2)))
        }
        if let targetSize = targetSize {
            options.append(.processor(DownsamplingImageProcessor(size: CGSize(width: targetSize.width * UIScreen.main.scale, height: targetSize.height * UIScreen.main.scale))))
        }
        kf.setImage(with: url, options: options, completionHandler: completionHandler)
    }

    public func clearImage() {
        image = nil
        kf.cancelDownloadTask()
    }
}
