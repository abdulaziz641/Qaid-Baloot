//
//  MainAppTextField.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 26/03/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit
class MainAppTextField: UITextField {
    
    init(text: String?, type: TextFieldType) {
        super.init(frame: .zero)
        
        if let text = text {
            self.text = text
        } else {
            self.text = " "
        }
        configureTextFieldDefaults(for: type)
    }
    
    private func configureTextFieldDefaults(for type: TextFieldType) {
        translatesAutoresizingMaskIntoConstraints = false
        switch type {
            
        case .defaultType:
            textFieldDefaults()
            
        }
    }
    
    private func textFieldDefaults() {
        text = "0"
        font = UIFont.boldSystemFont(ofSize: 22)
        textAlignment = .center
        textColor = .black
        backgroundColor = .white
        layer.cornerRadius = 8
        keyboardType = .numberPad
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
