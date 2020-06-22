//
//  MainTableCell.swift
//  CompositionalTest
//
//  Created by Pavel Moroz on 22.06.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class MainTableCell: UITableViewCell {
    
    enum Orientation {
        case portrait
        case landscape
    }
    
    static let reuseId = "MainTableCell"
    
    let mainLabel = UILabel()
    let descriptionLabel = UILabel()
    let actionButton = UIButton()
    
    var buttonsPortraitConstraint: NSLayoutConstraint!
    var buttonsLandscapeConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        mainLabel.font = UIFont.sfProDisplaySemibold(ofSize: 20)
        
        descriptionLabel.font = UIFont.sfProTextRegular(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        
        actionButton.layer.cornerRadius = 8
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        removeConstraints(mainLabel.constraints)
        removeConstraints(descriptionLabel.constraints)
        removeConstraints(actionButton.constraints)
        
        // подумать, как удалить предыдущие констрейнты
        
        // в условие добавить условие, что это не айпад
        if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
            print("port")
            
            setupElements(isPortrait: true)
            
        } else {
            print("land")
            setupElements(isPortrait: false)
        }
    }
    
    func setupElements(isPortrait: Bool) {
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainLabel)
        addSubview(descriptionLabel)
        addSubview(actionButton)
        
        if isPortrait {
            NSLayoutConstraint.activate([
                mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24)
            ])
            
            NSLayoutConstraint.activate([
                descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                descriptionLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 4),
                descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            ])
            
            NSLayoutConstraint.activate([
                actionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
                actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                actionButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
                actionButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        } else {
            NSLayoutConstraint.activate([
                mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
                mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                mainLabel.widthAnchor.constraint(equalToConstant: 382)
            ])
            
            NSLayoutConstraint.activate([
                descriptionLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 4),
                descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                descriptionLabel.widthAnchor.constraint(equalToConstant: 382)
            ])
            
            NSLayoutConstraint.activate([
                actionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
                actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                actionButton.widthAnchor.constraint(equalToConstant: 382),
                actionButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    
    func setupCell (mainLabel: String, description: String, buttonName: String, color: UIColor, buttonColor: UIColor) {
        self.mainLabel.text = mainLabel
        self.descriptionLabel.text = description
        self.actionButton.setTitle(buttonName, for: .normal)
        self.backgroundColor = color
        self.actionButton.backgroundColor = buttonColor
    }
}
