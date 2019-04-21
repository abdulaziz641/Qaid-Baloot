//
//  AppButton.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 22/03/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit

class MainAppButton: UIButton {
    
    init(buttonType: AppButton = .defaultButton, title: String?) {
        super.init(frame: .zero)
        
        if let title = title {
            setTitle(title, for: .normal)
        }
        configureButton(for: buttonType)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonDefaults()
    }
    
    private func configureButton(for type: AppButton) {
        translatesAutoresizingMaskIntoConstraints = false
        switch type {
        case .defaultButton:
            buttonDefaults()
            
        case .settingsButton:
            settingsDefaults()
            
        case .recordResultButton:
            recordButtonConfiguration()
        }
    }
    
    private func buttonDefaults() {
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        setTitleColor(.black, for: .normal)
        backgroundColor = .white
        layer.cornerRadius = 12
    }
    
    private func settingsDefaults() {
        let buttonImage = UIImage(named: "settingsNotFilled")
        setImage(buttonImage, for: .normal)
    }
    
    private func recordButtonConfiguration() {
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        setTitleColor(.black, for: .normal)
        backgroundColor = .white
        layer.cornerRadius = 12
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
