//
//  PhoneLoginOptionViewController.swift
//  LifeDemo
//
//  Created by Nozanin on 26/06/26.
//

import UIKit

class PhoneLoginOptionViewController: UIViewController {
    
    // MARK: - views
    
    private let tabLabel : UILabel = {
        let label = UILabel()
        label.text = "Введите номер телефона"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()
    
    private func applyConstraints() {
        [
            tabLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            tabLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tabLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tabLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ].forEach { $0.isActive = true }
    }
    
    
    // MARK: - override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabLabel)
    }
}
