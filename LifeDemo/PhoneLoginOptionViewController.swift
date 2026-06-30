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
        return label
    }()
    
    private let countryCodeImageView = UIImageView(image: UIImage(named: "taj_flag_icon"))
    
    private let countryCodeLabel : UILabel = {
        let label = UILabel()
        label.text = "+992"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private let phoneNumberStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    private let phoneNumberTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.layer.cornerRadius = 20
        return text
    }()
    
    // MARK: - private functions
    private func setupImageView(){
        countryCodeImageView.contentMode = .scaleAspectFit
        countryCodeImageView.translatesAutoresizingMaskIntoConstraints = false
//        countryCodeImageView.layoutMargins = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
    }
    
    private func applyConstraints() {
        [
            tabLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            tabLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tabLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            phoneNumberStackView.topAnchor.constraint(equalTo: tabLabel.bottomAnchor, constant: 16),
            phoneNumberStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            phoneNumberStackView.widthAnchor.constraint(equalToConstant: 114),
            phoneNumberStackView.heightAnchor.constraint(equalToConstant: 60),
            
            countryCodeImageView.widthAnchor.constraint(equalToConstant: 28),
            countryCodeImageView.heightAnchor.constraint(equalToConstant: 28),
            
            phoneNumberTextField.widthAnchor.constraint(equalToConstant: 239),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 60),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: phoneNumberStackView.trailingAnchor, constant: 8),
            phoneNumberTextField.topAnchor.constraint(equalTo: tabLabel.bottomAnchor, constant: 16)
        ].forEach { $0.isActive = true }
    }
    
    
    // MARK: - override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabLabel)
        view.addSubview(phoneNumberStackView)
        setupImageView()
        phoneNumberStackView.addArrangedSubview(countryCodeImageView)
        phoneNumberStackView.addArrangedSubview(countryCodeLabel)
        view.addSubview(phoneNumberTextField)
        applyConstraints()
    }
}
