//
//  ViewController.swift
//  LifeDemo
//
//  Created by Nozanin on 24/06/26.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - views
    
    private let lifeLogoImageView: UIImageView = {
        let lifeLogo = UIImageView(image: UIImage(named: "logo"))
        lifeLogo.translatesAutoresizingMaskIntoConstraints = false
        lifeLogo.contentMode = .scaleAspectFit
        
        return lifeLogo
    }()
    
    private let welcomeMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Добро пожаловать в Life"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    private let card1 = CustomCard(image: UIImage(named: "card_sim"), cardText: "Заказать SIM-карту")
    private let card2 = CustomCard(image: UIImage(named: "card_internet"), cardText: "Заявка на дом. интернет")
    private let card3 = CustomCard(image: UIImage(named: "card_map"), cardText: "Ближайшие офисы")
    
    private let cardsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        // changeLanguageContainer.distribution = .equalCentering
        return stackView
    }()
    
    private let changeLanguageIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "lang_change_icon"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let changeLanguageLabel: UILabel = {
        let changeLanguageLabel = UILabel()
        changeLanguageLabel.text = "Изменить язык"
        changeLanguageLabel.font = UIFont.systemFont(ofSize: 20)
        changeLanguageLabel.textColor = AppColors.green
        
        return changeLanguageLabel
    }()
    
    private let changeLanguageStackView: UIStackView = {
        let changeLanguageContainer = UIStackView()
        changeLanguageContainer.translatesAutoresizingMaskIntoConstraints = false
        changeLanguageContainer.axis = .horizontal
        changeLanguageContainer.alignment = .center
        changeLanguageContainer.spacing = 4
        //for event handling - views, addtarget to buttons
        changeLanguageContainer.isUserInteractionEnabled = true
        
        return changeLanguageContainer
    }()
    
    private let registrationButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        
        return button
    }()
    
    // MARK: - override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        
        setupNavbar()
        
        view.addSubview(lifeLogoImageView)
        view.addSubview(welcomeMessageLabel)
        view.addSubview(cardsStackView)
        
        cardsStackView.addArrangedSubview(card1)
        cardsStackView.addArrangedSubview(card2)
        cardsStackView.addArrangedSubview(card3)
        
        view.addSubview(changeLanguageStackView)

        changeLanguageStackView.addArrangedSubview(changeLanguageIcon)
        changeLanguageStackView.addArrangedSubview(changeLanguageLabel)
        
        view.addSubview(registrationButton)
        applyConstraints()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeLanguageStackViewTapped))
        changeLanguageStackView.addGestureRecognizer(tap)
        
        registrationButton.addTarget(self, action: #selector(goToSecondControllerView), for: .touchUpInside)
    }
    
    // MARK: - private methods
    
    private func setupNavbar() {
        let navBarButtonText: UILabel = {
            let navBarText = UILabel()
            navBarText.text = "Помощь"
            navBarText.font = UIFont.systemFont(ofSize: 20)
            navBarText.textColor = AppColors.green
            navBarText.backgroundColor = .clear
            navBarText.translatesAutoresizingMaskIntoConstraints = false
            
            return navBarText
        }()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navBarButtonText)
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            lifeLogoImageView.heightAnchor.constraint(equalToConstant: 128),
            lifeLogoImageView.widthAnchor.constraint(equalToConstant: 128),
            lifeLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lifeLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            welcomeMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeMessageLabel.topAnchor.constraint(equalTo: lifeLogoImageView.bottomAnchor, constant: 20),
            welcomeMessageLabel.heightAnchor.constraint(equalToConstant: 82),
            
            cardsStackView.topAnchor.constraint(equalTo: welcomeMessageLabel.bottomAnchor, constant: 20),
            cardsStackView.heightAnchor.constraint(equalToConstant: 100),
            cardsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            
            changeLanguageStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            changeLanguageContainer.widthAnchor.constraint(equalToConstant: 200),
            changeLanguageStackView.heightAnchor.constraint(equalToConstant: 50),
            changeLanguageStackView.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 20),
            
            registrationButton.topAnchor.constraint(equalTo: cardsStackView.bottomAnchor, constant: 80),
            registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
//        [
//            lifeLogoImageView.heightAnchor.constraint(equalToConstant: 128),
//            lifeLogoImageView.widthAnchor.constraint(equalToConstant: 128),
//            lifeLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            lifeLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        ].forEach { $0.isActive = true }
    }
    
    // MARK: - event handlers
    
    @objc func goToSecondControllerView() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @objc func changeLanguageStackViewTapped() {
        let langListViewController = LanguageListViewController()
        langListViewController.modalPresentationStyle = .pageSheet
        if let sheet = langListViewController.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in 200 })]
        }
        present(langListViewController, animated: true)
    }
}

