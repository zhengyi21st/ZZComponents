//
//  LoadingViewController.swift
//  ZZComponentsExample
//
//  Created by Ethan on 2022/9/26.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit
import ZZComponents

class LoadingViewController: UIViewController {
    
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
            $0.setTitle("Show Loading", for: .normal)
            $0.setTitleColor(ZZColor.systemBlue, for: .normal)
            $0.contentEdgeInsets = .init(top: 12, left: 16, bottom: 12, right: 16)
            $0.addTarget(self, action: #selector(handleShowLoading), for: .touchUpInside)
            return $0
        }(UIButton(type: .system)),
        {
            $0.titleLabel?.font = ZZFont.body()
            $0.setTitle("Show Loading with Text", for: .normal)
            $0.setTitleColor(ZZColor.systemBlue, for: .normal)
            $0.contentEdgeInsets = .init(top: 12, left: 16, bottom: 12, right: 16)
            $0.addTarget(self, action: #selector(handleShowTextLoading), for: .touchUpInside)
            return $0
        }(UIButton(type: .system))
    ]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Loading"
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
    
    @objc func handleShowLoading() {
        let loading = ZZLoading.show(at: view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            loading.hide()
        })
    }
    
    @objc func handleShowTextLoading() {
        let loading = ZZLoading.show("Loading...", at: view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            loading.hide()
        })
    }
}
