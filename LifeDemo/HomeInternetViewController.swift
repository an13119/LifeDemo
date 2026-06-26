//
//  PhoneLoginOptionViewController 2.swift
//  LifeDemo
//
//  Created by Nozanin on 26/06/26.
//


import UIKit

class HomeInternetViewController : UIViewController {
    
    // MARK: - views
    
    private let tabLabel : UILabel = {
        let label = UILabel()
        label.text = "Домашний интернет"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabLabel)
    }
}
