//
//  ButtonViewController.swift
//  ZZComponentsExample
//
//  Created by Ethan on 2022/9/22.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit
import ZZComponents

class ButtonViewController: UIViewController {
    
    lazy var scrollView: UIScrollView =  {
        $0.alwaysBounceVertical = true
        return $0
    }(UIScrollView())
    
    lazy var stackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 16
        return $0
    }(UIStackView(arrangedSubviews: [
        {
            $0.titleLabel?.font = ZZFont.body()
            $0.setTitle("Button", for: .normal)
            $0.setTitleColor(ZZColor.systemBlue, for: .normal)
            $0.contentEdgeInsets = .init(top: 12, left: 16, bottom: 12, right: 16)
            return $0
        }(ZZButton()),
        {
            $0.titleLabel?.font = ZZFont.body()
            $0.setTitle("Button with left image", for: .normal)
            $0.setTitleColor(ZZColor.systemWhite, for: .normal)
            $0.layer.cornerRadius = 8
            $0.backgroundColor = ZZColor.systemBlue
            $0.tintColor = ZZColor.systemWhite
            $0.contentEdgeInsets = .init(top: 12, left: 16, bottom: 12, right: 16)
            $0.setLeftImage(ZZColor.image(color: ZZColor.systemGrey, size: CGSize(width: 16, height: 16)), spacing: 5, for: .normal)
            return $0
        }(ZZButton()),
        {
            $0.titleLabel?.font = ZZFont.body()
            $0.setTitle("Button with right image", for: .normal)
            $0.setTitleColor(ZZColor.systemWhite, for: .normal)
            $0.layer.cornerRadius = 8
            $0.backgroundColor = ZZColor.systemBlue
            $0.tintColor = ZZColor.systemWhite
            $0.contentEdgeInsets = .init(top: 12, left: 16, bottom: 12, right: 16)
            $0.setRightImage(ZZColor.image(color: ZZColor.systemGrey, size: CGSize(width: 16, height: 16)), spacing: 5, for: .normal)
            return $0
        }(ZZButton()),
        {
            $0.titleLabel?.font = ZZFont.body()
            $0.setTitle("Touch Highlight", for: .normal)
            $0.setTitleColor(ZZColor.systemWhite, for: .normal)
            $0.layer.cornerRadius = 8
            $0.backgroundColor = ZZColor.systemBlue
            $0.tintColor = ZZColor.systemWhite
            $0.contentEdgeInsets = .init(top: 12, left: 16, bottom: 12, right: 16)
            return $0
        }(ZZButton(style: .touchHighlight)),
        {
            $0.titleLabel?.font = ZZFont.body()
            $0.setTitle("Touch Opacity", for: .normal)
            $0.setTitleColor(ZZColor.systemWhite, for: .normal)
            $0.layer.cornerRadius = 8
            $0.backgroundColor = ZZColor.systemBlue
            $0.tintColor = ZZColor.systemWhite
            $0.contentEdgeInsets = .init(top: 12, left: 16, bottom: 12, right: 16)
            return $0
        }(ZZButton(style: [.touchOpacity])),
        {
            $0.titleLabel?.font = ZZFont.body()
            $0.setTitle("Touch Bounce", for: .normal)
            $0.setTitleColor(ZZColor.systemWhite, for: .normal)
            $0.layer.cornerRadius = 8
            $0.backgroundColor = ZZColor.systemBlue
            $0.tintColor = ZZColor.systemWhite
            $0.contentEdgeInsets = .init(top: 12, left: 16, bottom: 12, right: 16)
            return $0
        }(ZZButton(style: .touchBounce)),
        {
            $0.titleLabel?.font = ZZFont.body()
            $0.setTitle("Loading Button", for: .normal)
            $0.setTitleColor(ZZColor.systemWhite, for: .normal)
            $0.layer.cornerRadius = 8
            $0.backgroundColor = ZZColor.systemBlue
            $0.tintColor = ZZColor.systemWhite
            $0.contentEdgeInsets = .init(top: 12, left: 16, bottom: 12, right: 16)
            $0.addTarget(self, action: #selector(handleLoading), for: .touchUpInside)
            return $0
        }(ZZButton())
    ]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Button"
        view.backgroundColor = ZZColor.background
        view.backgroundColor = ZZColor.background
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.centerX.equalTo(scrollView)
            make.top.equalTo(scrollView).offset(16)
            make.bottom.equalTo(scrollView).offset(-16)
        }
    }
    
    @objc private func handleLoading(_ sender: Any) {
        guard let button = sender as? ZZButton else { return }
        button.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            button.isLoading = false
        })
    }
}
