//
//  LanguageCell.swift
//  LifeDemo
//
//  Created by Nozanin on 01/07/26.
//

import UIKit

class CustomLanguageCell: UITableViewCell {
    let langIcon = UIImageView()
    let langLabel = UILabel()
    let langSubLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCellUI()
    }
    
    func setupCellUI() {
        contentView.addSubview(langLabel)
        contentView.addSubview(langIcon)
        contentView.addSubview(langSubLabel)
        langIcon.translatesAutoresizingMaskIntoConstraints = false
        langLabel.translatesAutoresizingMaskIntoConstraints = false
        langSubLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            langIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            langIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            langLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            langLabel.leadingAnchor.constraint(equalTo: langIcon.trailingAnchor, constant: 10),
            
            langSubLabel.leadingAnchor.constraint(equalTo: langIcon.trailingAnchor),
            langSubLabel.topAnchor.constraint(equalTo: langLabel.bottomAnchor, constant: 2),
            langSubLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ].forEach { $0.isActive = true }
    }
    
    func filldata(img: UIImage, label: String, subLabel: String) {
        langIcon.image = img
        langLabel.text = label
        langSubLabel.text = subLabel
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        langIcon.image = nil
        langLabel.text = nil
        langSubLabel.text = nil
    }
}
