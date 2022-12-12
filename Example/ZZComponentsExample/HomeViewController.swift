//
//  HomeViewController.swift
//  ZZComponentsExample
//
//  Created by Ethan on 2022/9/22.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit
import ZZComponents

struct ZZExample {
    var title: String
    var cls: UIViewController.Type
}

class HomeViewController: UIViewController {

    lazy var tableView: UITableView =  {
        $0.delegate = self
        $0.dataSource = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        $0.backgroundColor = .clear
        $0.tableFooterView = UIView()
        return $0
    }(UITableView(frame: .zero, style: .plain))

    var examples: [ZZExample] = [
        .init(title: "ActivityIndicatorView", cls: ActivityIndicatorViewController.self),
        .init(title: "Button", cls: ButtonViewController.self),
        .init(title: "Color", cls: ColorViewController.self),
        .init(title: "Font", cls: FontViewController.self),
        .init(title: "Gradient", cls: GradientViewController.self),
        .init(title: "ImageView", cls: ImageViewController.self),
        .init(title: "Loading", cls: LoadingViewController.self),
        .init(title: "Toast", cls: ToastViewController.self)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ZZComponents"
        view.backgroundColor = ZZColor.background
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = examples[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = examples[indexPath.row]
        navigationController?.pushViewController(item.cls.init(), animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 49
    }
}
