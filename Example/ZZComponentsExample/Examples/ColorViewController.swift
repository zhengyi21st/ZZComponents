//
//  ColorViewController.swift
//  ZZComponentsExample
//
//  Created by Ethan on 2022/9/22.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit
import ZZComponents

struct ZZColorSample {
    var title: String
    var color: UIColor
}

// MARK: - ColorCell

class ColorCell: UICollectionViewCell {

    lazy var colorView = UIView()

    lazy var textLabel: UILabel =  {
        $0.font = ZZFont.subheadline()
        $0.textColor = ZZColor.systemWhite
        $0.layer.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1.0
        $0.layer.shadowRadius = 3.0
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
        contentView.addSubview(colorView)
        contentView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        colorView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func update(item: ZZColorSample) {
        textLabel.text = item.title
        colorView.backgroundColor = item.color
    }
}

class ColorViewController: UIViewController {

    lazy var collectionView: UICollectionView =  {
        $0.register(ColorCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        $0.backgroundColor = .clear
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))

    var colors: [ZZColorSample] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Color"
        view.backgroundColor = ZZColor.background
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.bottom.equalToSuperview()
        }
        colors = [
            .init(title: "label", color: ZZColor.label),
            .init(title: "secondaryLabel", color: ZZColor.secondaryLabel),
            .init(title: "tertiaryLabel", color: ZZColor.tertiaryLabel),
            .init(title: "quaternaryLabel", color: ZZColor.quaternaryLabel),
            .init(title: "background", color: ZZColor.background),
            .init(title: "secondarBackground", color: ZZColor.secondarBackground),
            .init(title: "tertiaryBackground", color: ZZColor.tertiaryBackground),
            .init(title: "groupedBackground", color: ZZColor.groupedBackground),
            .init(title: "secondaryGroupedBackground", color: ZZColor.secondaryGroupedBackground),
            .init(title: "tertiaryGroupedBackground", color: ZZColor.tertiaryGroupedBackground),
            .init(title: "separator", color: ZZColor.separator),
            .init(title: "systemRed", color: ZZColor.systemRed),
            .init(title: "systemOrange", color: ZZColor.systemOrange),
            .init(title: "systemYellow", color: ZZColor.systemYellow),
            .init(title: "systemGreen", color: ZZColor.systemGreen),
            .init(title: "systemMint", color: ZZColor.systemMint),
            .init(title: "systemTeal", color: ZZColor.systemTeal),
            .init(title: "systemCyan", color: ZZColor.systemCyan),
            .init(title: "systemBlue", color: ZZColor.systemBlue),
            .init(title: "systemIndigo", color: ZZColor.systemIndigo),
            .init(title: "systemPurple", color: ZZColor.systemPurple),
            .init(title: "systemPink", color: ZZColor.systemPink),
            .init(title: "systemBrown", color: ZZColor.systemBrown),
            .init(title: "systemWhite", color: ZZColor.systemWhite),
            .init(title: "systemGrey", color: ZZColor.systemGrey),
            .init(title: "systemGrey2", color: ZZColor.systemGrey2),
            .init(title: "systemGrey3", color: ZZColor.systemGrey3),
            .init(title: "systemGrey4", color: ZZColor.systemGrey4),
            .init(title: "systemGrey5", color: ZZColor.systemGrey5),
            .init(title: "systemGrey6", color: ZZColor.systemGrey6),
            .init(title: "systemBlack", color: ZZColor.systemBlack),
            .init(title: "fill", color: ZZColor.fill),
            .init(title: "secondaryFill", color: ZZColor.secondaryFill),
            .init(title: "tertiaryFill", color: ZZColor.tertiaryFill),
            .init(title: "quaternaryFill", color: ZZColor.quaternaryFill)
        ]
        collectionView.reloadData()
    }

}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

extension ColorViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! ColorCell
        cell.update(item: colors[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
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
