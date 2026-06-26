//
//  CardView.swift
//  LifeDemo
//
//  Created by Nozanin on 25/06/26.
//

import UIKit

class CustomCard: UIView {
        
    private let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let cardTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.font = .systemFont(ofSize: 14, weight: .regular)
        textLabel.textAlignment = .center
        textLabel.textColor = .black
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cardViewDesign()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        cardViewDesign()
    }
    
    init(image: UIImage?, cardText: String) {
        super.init(frame: .zero)
        self.cardImageView.image = image
        self.cardTextLabel.text = cardText
        cardViewDesign()
    }
    
    func cardViewDesign() {
        backgroundColor = .white
        self.layer.cornerRadius = 20
        
        addSubview(cardImageView)
        addSubview(cardTextLabel)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 115),
            heightAnchor.constraint(equalToConstant: 100),
            
            cardImageView.widthAnchor.constraint(equalToConstant: 40),
            cardImageView.heightAnchor.constraint(equalToConstant: 40),
            cardImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            cardTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardTextLabel.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 8),
        ])
        
        
        
    }
}
