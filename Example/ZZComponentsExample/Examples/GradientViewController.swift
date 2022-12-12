//
//  GradientViewController.swift
//  ZZComponentsExample
//
//  Created by Ethan on 2022/9/22.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit
import ZZComponents

class GradientViewController: UIViewController {
    
    lazy var gradientView: ZZGradientView =  {
        $0.colors = [ZZColor.systemPink, ZZColor.systemBlue]
        $0.locations = [0,1]
        $0.startPoint = CGPoint(x: 0.5, y: 0)
        $0.endPoint = CGPoint(x: 0.5, y: 1)
        $0.layer.cornerRadius = 8
        return $0
    }(ZZGradientView())
    
    lazy var horizontalGradientLabel: ZZGradientLabel = {
        $0.colors = [ZZColor.systemPink, ZZColor.systemBlue]
        $0.font = .systemFont(ofSize: 27)
        $0.text = "Gradient Label"
        $0.direction = .horizontal
        return $0
    }(ZZGradientLabel())
    
    lazy var verticalGradientLabel: ZZGradientLabel = {
        $0.colors = [ZZColor.systemPink, ZZColor.systemBlue]
        $0.font = .systemFont(ofSize: 27)
        $0.text = "Gradient Label"
        $0.direction = .vertical
        return $0
    }(ZZGradientLabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gradient"
        view.backgroundColor = ZZColor.background
        view.addSubview(gradientView)
        view.addSubview(horizontalGradientLabel)
        view.addSubview(verticalGradientLabel)
        gradientView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.size.equalTo(CGSize(width: 256, height: 256))
            make.centerX.equalToSuperview()
        }
        horizontalGradientLabel.snp.makeConstraints { make in
            make.top.equalTo(gradientView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        verticalGradientLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalGradientLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
}
