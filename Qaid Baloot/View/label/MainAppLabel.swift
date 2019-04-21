//
//  MainLabel.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 26/03/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit
class MainLabel: UILabel {
    
    init(text: String?, type: LabelType) {
        super.init(frame: .zero)
        
        if let text = text {
            self.text = text
        }
        configureLabel(for: type)
    }
    
    private func configureLabel(for type: LabelType) {
        translatesAutoresizingMaskIntoConstraints = false
        switch type {
            
        case .defaultLabel:
            labelDefaults()
            
        case .resultLabel:
            resultLabel()
        }
    }
    
    private func labelDefaults() {
        font = UIFont.boldSystemFont(ofSize: 20)
        textAlignment = .center
        textColor = .white
    }
    
    private func resultLabel() {
        font = UIFont.boldSystemFont(ofSize: 35)
        textAlignment = .center
        textColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
