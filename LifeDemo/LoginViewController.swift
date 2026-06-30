//
//  LoginViewController.swift
//  LifeDemo
//
//  Created by Nozanin on 26/06/26.
//

import UIKit

class LoginViewController : UIViewController {
    let tab1 = PhoneLoginOptionViewController()
    let tab2 = HomeInternetViewController()
    
    let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Мобильная связь", "Домашний интернет"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layoutMargins = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10)
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 15)], for: .normal)
        return segmentedControl
    }()
    
    // MARK: - private methods
    private func setupNavbar() {
        let navBarTitleText: UILabel = {
            let navBarTitle = UILabel()
            navBarTitle.text = "Войти"
            navBarTitle.textAlignment = .center
            navBarTitle.font = UIFont.boldSystemFont(ofSize: 20)
            navBarTitle.textColor = .black
            navBarTitle.backgroundColor = .clear

            navBarTitle.translatesAutoresizingMaskIntoConstraints = false
            
            return navBarTitle
        }()
        
        navigationItem.titleView = navBarTitleText
    }
    
    private func setupViewControllers() {
        let tabs = [tab1, tab2]
        
        for tab in tabs {
            addChild(tab)
            view.addSubview(tab.view)
            tab.didMove(toParent: self)
            tab.view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        tab1.view.isHidden = false
        tab2.view.isHidden = true
    }
    
    private func applyConstraints() {
        [
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            segmentedControl.heightAnchor.constraint(equalToConstant: 35),
            
            tab1.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            tab1.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tab1.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tab2.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            tab2.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tab2.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ].forEach {$0.isActive = true}
    }

    // MARK: - action functions

    @objc func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            tab2.view.isHidden = true
            tab1.view.isHidden = false
        } else {
            tab1.view.isHidden = true
            tab2.view.isHidden = false
        }
    }
    
    // MARK: - override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white.withAlphaComponent(0.9)
        setupNavbar()
        view.addSubview(segmentedControl)
        setupViewControllers()
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        applyConstraints()
    }
    
}



