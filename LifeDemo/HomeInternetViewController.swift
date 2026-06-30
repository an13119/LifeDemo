//
//  PhoneLoginOptionViewController.swift
//  LifeDemo
//
//  Created by Nozanin on 26/06/26.
//

import UIKit

class HomeInternetViewController: UIViewController {
    
    // MARK: - views
    
    private let tabTextLabel : UILabel = {
        let label = UILabel()
        label.text = "Введите лицевой счет"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let accountNumTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.layer.cornerRadius = 20
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        text.leftViewMode = .always
        text.textColor = .black
        text.attributedPlaceholder = NSAttributedString(string: "Лицевой счет", attributes: [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 17)])
        return text
    }()
    
    private let accountSetUplabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let part1 = NSAttributedString(string: "Нет лицевого счета? ", attributes: [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 17)])
        let part2 = NSAttributedString(string: "Открыть", attributes: [.foregroundColor: AppColors.green, .font: UIFont.systemFont(ofSize: 17)])
        let fullLabel = NSMutableAttributedString()
        fullLabel.append(part1)
        fullLabel.append(part2)
        label.attributedText = fullLabel
        return label
    }()
    
    private let buttonContinue : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Продолжить", for: .normal)
        return btn
    }()
    
    
    // MARK: - private functions
    
    private func applyConstraints() {
        [
            tabTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            tabTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tabTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            accountNumTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            accountNumTextField.heightAnchor.constraint(equalToConstant: 60),
            accountNumTextField.topAnchor.constraint(equalTo: tabTextLabel.bottomAnchor, constant: 16),
            accountNumTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            accountSetUplabel.topAnchor.constraint(equalTo: accountNumTextField.bottomAnchor, constant: 26),
            accountSetUplabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonContinue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonContinue.topAnchor.constraint(equalTo: accountSetUplabel.bottomAnchor, constant: 200),
            buttonContinue.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ].forEach { $0.isActive = true }
    }
    
    // MARK: - override methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabTextLabel)
        view.addSubview(accountNumTextField)
        view.addSubview(accountSetUplabel)
        view.addSubview(buttonContinue)
        applyConstraints()
    }
}
