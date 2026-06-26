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
        label.text = "Мобильная связь"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func applyConstraints() {
        [
            tabLabel.heightAnchor.constraint(equalToConstant: 128),
            tabLabel.widthAnchor.constraint(equalToConstant: 128),
            tabLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            tabLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ].forEach { $0.isActive = true }
    }
    
    
    // MARK: - override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabLabel)
    }
}
