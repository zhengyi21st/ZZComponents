//
//  ZZSeparator.swift
//  ZZComponents
//
//  Created by Ethan on 2022/9/22.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit

open class ZZSeparator: UIView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = ZZColor.separator
    }

    open override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width, height: 1 / UIScreen.main.scale)
    }

}
