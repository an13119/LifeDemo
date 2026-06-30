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
        stackView.alignment = .center
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 20
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let phoneNumberTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.layer.cornerRadius = 20
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        text.leftViewMode = .always
        text.attributedPlaceholder = NSAttributedString(string: "Номер телефона", attributes: [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 17)])
        text.keyboardType = .numberPad
        return text
    }()
    
    private let orderSimLabel : UILabel = {
        let label = UILabel()
        //label.text = "Нет SIM-карты? Заказать"
        label.translatesAutoresizingMaskIntoConstraints = false
        
//        let part1 = NSAttributedString(string: "Нет SIM-карты?", attributes: [.foregroundColor = UIColor.gray])
//        let part2 = NSAttributedString(string: "Заказать", attributes: [.foregroundColor = AppColors.green])
        return label
    }()
    
    // MARK: - private functions
    private func setupImageView(){
        countryCodeImageView.contentMode = .scaleAspectFit
        countryCodeImageView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func applyConstraints() {
        [
            tabLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            tabLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tabLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            phoneNumberStackView.topAnchor.constraint(equalTo: tabLabel.bottomAnchor, constant: 16),
            phoneNumberStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            phoneNumberStackView.heightAnchor.constraint(equalToConstant: 60),
            
            countryCodeImageView.widthAnchor.constraint(equalToConstant: 28),
            countryCodeImageView.heightAnchor.constraint(equalToConstant: 28),
            
            phoneNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
        view.addSubview(orderSimLabel)
        applyConstraints()
    }
}
