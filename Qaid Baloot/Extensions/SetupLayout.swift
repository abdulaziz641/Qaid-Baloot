//
//  SetupLayout.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 22/03/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit
extension MainViewController {
    
    func setupLayout() {
        initializeViews()
        setupTopContainerView()
        setupResultViewController()
        setupUsViewContainer()
        setupThemViewContainer()
        setupButtonsAndLabeles()
        setupStackViews()
    }
        
    fileprivate func initializeViews() {
        topViewContainerView = UIView()
        resultViewContainer = UIView()
        usViewContainer = UIView()
        themViewContainer = UIView()
    }
    
    fileprivate func setupTopContainerView() {
        topViewContainerView.translatesAutoresizingMaskIntoConstraints = false
        topViewContainerView.backgroundColor = .red
        view.addSubview(topViewContainerView)
        
        NSLayoutConstraint.activate([
            topViewContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topViewContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topViewContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topViewContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            ])
    }
    
    fileprivate func setupResultViewController() {
        resultViewContainer.translatesAutoresizingMaskIntoConstraints = false
        resultViewContainer.backgroundColor = .blue
        
        view.addSubview(resultViewContainer)
        resultViewContainer.addSubview(usViewContainer)
        resultViewContainer.addSubview(themViewContainer)
        
        NSLayoutConstraint.activate([
            resultViewContainer.topAnchor.constraint(equalTo: topViewContainerView.bottomAnchor),
            resultViewContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resultViewContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            resultViewContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            ])
    }
    
    fileprivate func setupUsViewContainer() {
        usViewContainer.translatesAutoresizingMaskIntoConstraints = false
        usViewContainer.backgroundColor = .gray
        usViewContainer.addSubview(usLabel1)
        
        NSLayoutConstraint.activate([
            usViewContainer.trailingAnchor.constraint(equalTo: resultViewContainer.trailingAnchor),
            usViewContainer.topAnchor.constraint(equalTo: resultViewContainer.topAnchor),
            usViewContainer.bottomAnchor.constraint(equalTo: resultViewContainer.bottomAnchor),
            usViewContainer.widthAnchor.constraint(equalTo: resultViewContainer.widthAnchor, multiplier: 0.5),
            ])
    }
    
    fileprivate func setupThemViewContainer() {
        themViewContainer.translatesAutoresizingMaskIntoConstraints = false
        themViewContainer.backgroundColor = .cyan
        themViewContainer.addSubview(themLabel1)
        
        NSLayoutConstraint.activate([
            themViewContainer.leadingAnchor.constraint(equalTo: resultViewContainer.leadingAnchor),
            themViewContainer.topAnchor.constraint(equalTo: resultViewContainer.topAnchor),
            themViewContainer.bottomAnchor.constraint(equalTo: resultViewContainer.bottomAnchor),
            themViewContainer.widthAnchor.constraint(equalTo: resultViewContainer.widthAnchor, multiplier: 0.5),
            ])
        
    }
    
    fileprivate func setupStackViews() {
        setupThemStackView()
        setupUsStackView()
        setupThemUsStackView()
        setupCenterStackViewContainer()
    }
    
    fileprivate func setupThemStackView() {
        themStackView = UIStackView(arrangedSubviews: [themLabel, themTextField])
        themStackView.axis = .vertical
        themStackView.alignment = .center
        themStackView.spacing = 20
        themStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func setupUsStackView() {
        usStackView = UIStackView(arrangedSubviews: [usLabel, usTextField])
        usStackView.axis = .vertical
        usStackView.alignment = .center
        usStackView.spacing = 20
        usStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func setupCenterStackViewContainer() {
        centerStackViewContainer = UIStackView(arrangedSubviews: [themUsStackView, recordResultButton])
        centerStackViewContainer.axis = .horizontal
        centerStackViewContainer.alignment = .trailing
        centerStackViewContainer.spacing = 16
        centerStackViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        topViewContainerView.addSubview(centerStackViewContainer)
        
        NSLayoutConstraint.activate([
            centerStackViewContainer.centerXAnchor.constraint(equalTo: topViewContainerView.centerXAnchor),
            centerStackViewContainer.centerYAnchor.constraint(equalTo: topViewContainerView.centerYAnchor),
            ])
    }
    
    fileprivate func setupThemUsStackView() {
        themUsStackView = UIStackView(arrangedSubviews: [themStackView, usStackView])
        themUsStackView.axis = .horizontal
        themUsStackView.alignment = .center
        themUsStackView.distribution = .equalCentering
        themUsStackView.spacing = 8
        themUsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func setupButtonsAndLabeles() {
        
        NSLayoutConstraint.activate([
            recordResultButton.widthAnchor.constraint(equalToConstant: 128),
            recordResultButton.heightAnchor.constraint(equalToConstant: 44),
            themTextField.widthAnchor.constraint(equalToConstant: 75),
            themTextField.heightAnchor.constraint(equalToConstant: 32),
            usTextField.widthAnchor.constraint(equalToConstant: 75),
            usTextField.heightAnchor.constraint(equalToConstant: 32),
            usLabel1.centerXAnchor.constraint(equalTo: usViewContainer.centerXAnchor),
            usLabel1.topAnchor.constraint(equalTo: usViewContainer.topAnchor, constant: 32),
            themLabel1.centerXAnchor.constraint(equalTo: themViewContainer.centerXAnchor),
            themLabel1.topAnchor.constraint(equalTo: themViewContainer.topAnchor, constant: 32),
            ])
    }
    
}
