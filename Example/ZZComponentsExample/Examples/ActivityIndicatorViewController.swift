//
//  ActivityIndicatorViewController.swift
//  ZZComponentsExample
//
//  Created by Ethan on 2022/12/1.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit
import ZZComponents

class ActivityIndicatorViewController: UIViewController {
    
    lazy var activityIndicatorView: ZZActivityIndicatorView =  {
        return $0
    }(ZZActivityIndicatorView())
    
    lazy var scrollView: UIScrollView =  {
        $0.alwaysBounceVertical = true
        return $0
    }(UIScrollView())
    
    lazy var stackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 64
        return $0
    }(UIStackView(arrangedSubviews: [
        {
            $0.colors = [ZZColor.systemGrey]
            $0.startAnimating()
            return $0
        }(ZZActivityIndicatorView()),
        {
            $0.colors = [ZZColor.systemRed, ZZColor.systemBlue, ZZColor.systemOrange]
            $0.startAnimating()
            return $0
        }(ZZActivityIndicatorView())
    ]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ZZColor.background
        title = "ActivityIndicatorView"
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
}
