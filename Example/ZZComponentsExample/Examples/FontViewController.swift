//
//  FontViewController.swift
//  ZZComponentsExample
//
//  Created by Ethan on 2022/9/22.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit
import ZZComponents

struct ZZFontSample {
    var title: String
    var font: UIFont
}

// MARK: - FontCell

class FontCell: UICollectionViewCell {

    lazy var textLabel: UILabel =  {
        $0.textColor = ZZColor.label
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        contentView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.centerX.bottom.equalToSuperview()
        }
    }

    func update(item: ZZFontSample) {
        textLabel.text = item.title
        textLabel.font = item.font
    }
}

class FontViewController: UIViewController {

    lazy var collectionView: UICollectionView =  {
        $0.register(FontCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        $0.backgroundColor = .clear
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))

    var fonts: [ZZFontSample] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Font"
        view.backgroundColor = ZZColor.background
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.bottom.equalToSuperview()
        }
        fonts = [
            .init(title: "largeTitle: \(ZZFont.largeTitleSize)pt", font: ZZFont.largeTitle()),
            .init(title: "title1: \(ZZFont.title1Size)pt", font: ZZFont.title1()),
            .init(title: "title2: \(ZZFont.title2Size)pt", font: ZZFont.title2()),
            .init(title: "title3: \(ZZFont.title3Size)pt", font: ZZFont.title3()),
            .init(title: "headline: \(ZZFont.headlineSize)pt", font: ZZFont.headline()),
            .init(title: "body: \(ZZFont.bodySize)pt", font: ZZFont.body()),
            .init(title: "callout: \(ZZFont.calloutSize)pt", font: ZZFont.callout()),
            .init(title: "subheadline: \(ZZFont.subheadlineSize)pt", font: ZZFont.subheadline()),
            .init(title: "footnote: \(ZZFont.footnoteSize)pt", font: ZZFont.footnote()),
            .init(title: "caption1: \(ZZFont.caption1Size)pt", font: ZZFont.caption1()),
            .init(title: "caption2: \(ZZFont.caption2Size)pt", font: ZZFont.caption2())
        ]
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

extension FontViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fonts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! FontCell
        cell.update(item: fonts[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 15, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 56)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
