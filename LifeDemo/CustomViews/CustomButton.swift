//
//  CustomButton.swift
//  LifeDemo
//
//  Created by Nozanin on 24/06/26.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonDesign()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buttonDesign()
    }
    
    func buttonDesign() {
        backgroundColor = UIColor(
            red: 0,
            green: 185/255,
            blue: 86/255,
            alpha: 1
        )
        setTitleColor(UIColor.white, for: .normal)
        layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 361),
            heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
