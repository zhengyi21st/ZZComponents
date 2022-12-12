//
//  ImageViewController.swift
//  ZZComponentsExample
//
//  Created by Ethan on 2022/9/28.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit
import ZZComponents
import Kingfisher

class ImageViewController: UIViewController {
    
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
            $0.setImage(
                url: URL(string: "https://cn.bing.com/th?id=OHR.JohnstonWater_ZH-CN3121890365_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp"),
                targetSize: CGSize(width: 128, height: 128)
            )
            $0.backgroundColor = ZZColor.fill
            $0.snp.makeConstraints { make in
                make.size.equalTo(CGSize(width: 128, height: 128))
            }
            return $0
        }(ZZImageView()),
        {
            $0.isRounded = true
            $0.setImage(
                url: URL(string: "https://cn.bing.com/th?id=OHR.RadcliffeCamera_EN-CN5700316396_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp"),
                targetSize: CGSize(width: 128, height: 128)
            )
            $0.backgroundColor = ZZColor.fill
            $0.snp.makeConstraints { make in
                make.size.equalTo(CGSize(width: 128, height: 128))
            }
            return $0
        }(ZZImageView()),
        {
            $0.isRounded = true
            $0.setImage(
                url: URL(string: "https://cn.bing.com/th?id=OHR.RadcliffeCamera_EN-CN5700316396_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp"),
                targetSize: CGSize(width: 8, height: 8)
            )
            $0.backgroundColor = ZZColor.fill
            $0.snp.makeConstraints { make in
                make.size.equalTo(CGSize(width: 128, height: 128))
            }
            return $0
        }(ZZImageView()),
        {
            let targetSize = CGSize(width: 128, height: 128)
            $0.isRounded = true
            $0.borderColor = ZZColor.separator
            $0.defaultImage = UIImage(named: "default-avatar-320x320")
            $0.layer.borderWidth =  1 / UIScreen.main.scale
            $0.snp.makeConstraints { make in
                make.size.equalTo(targetSize)
            }
            return $0
        }(ZZImageView()),
        {
            let targetSize = CGSize(width: 128, height: 128)
            $0.isRounded = true
            $0.borderColor = ZZColor.separator
            $0.layer.borderWidth =  1 / UIScreen.main.scale
            $0.defaultImage = UIImage(named: "default-avatar-320x320")
            $0.setImage(
                url: URL(string: "https://i.pravatar.cc/\(UInt(128 * UIScreen.main.scale))?img=1"),
                targetSize: targetSize
            )
            $0.snp.makeConstraints { make in
                make.size.equalTo(targetSize)
            }
            return $0
        }(ZZImageView())
    ]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Action", style: .plain, target: self, action: #selector(handleAction))
        title = "ImageView"
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
    
    @objc func handleAction() {
        let alert = UIAlertController(title: "Action", message: nil, preferredStyle: .actionSheet)
        alert.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        alert.popoverPresentationController?.permittedArrowDirections = .any
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Clean Cache", style: .default, handler: { _ in
            ImageCache.default.clearMemoryCache()
            ImageCache.default.clearDiskCache()
        }))
        present(alert, animated: true, completion: nil)
    }
}
