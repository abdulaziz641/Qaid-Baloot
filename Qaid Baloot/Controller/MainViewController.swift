//
//  ViewController.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 15/03/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let recordResultButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("سجل", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(.black, for: .normal)
        button.isEnabled = true
        button.isUserInteractionEnabled = true
        button.layer.cornerRadius = 12
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let usLabel: UILabel = {
       let label = UILabel()
        label.text = "لنا"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let usLabel1: UILabel = {
        let label = UILabel()
        label.text = "لنا"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let usTextField: UITextField = {
        let textField = UITextField()
        textField.text = "0"
        textField.font = UIFont.boldSystemFont(ofSize: 22)
        textField.textAlignment = .center
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let themLabel: UILabel = {
        let label = UILabel()
        label.text = "لهم"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let themLabel1: UILabel = {
        let label = UILabel()
        label.text = "لهم"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let themTextField: UITextField = {
        let textField = UITextField()
        textField.text = "0"
        textField.font = UIFont.boldSystemFont(ofSize: 22)
        textField.textAlignment = .center
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.keyboardType = .numberPad
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: UI Views
    var topViewContainerView: UIView!
    var resultViewContainer: UIView!
    var usViewContainer: UIView!
    var themViewContainer: UIView!
    
    //MARK: Stack Views
    var themStackView: UIStackView!
    var usStackView: UIStackView!
    var themUsStackView: UIStackView!
    var centerStackViewContainer: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        setupLayout()
//        subscribeToNotificationsObserver()
        usTextField.delegate = self
        themTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
    }
}
