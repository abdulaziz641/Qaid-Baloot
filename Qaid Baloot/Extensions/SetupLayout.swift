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
        setupMainViewBackground()
        setupTopContainerView()
        setupResultViewController()
        setupUsViewContainer()
        setupThemViewContainer()
        setupTableView()
        setupButtonsAndLabeles()
        setupStackViews()
//        disableViewColors()
    }
    
    fileprivate func initializeViews() {
        ourTextField.delegate = self
        theirTextField.delegate = self
        view.backgroundColor = .clear
        hideKeyboardWhenTappedAround()
        topViewContainerView = UIView()
        scoreViewContainer = UIView()
        ourViewContainer = UIView()
        theirViewContainer = UIView()
    }
    
    fileprivate func setupMainViewBackground() {
        view.addSubview(mainViewImageView)
        
        NSLayoutConstraint.activate([
            mainViewImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainViewImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainViewImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainViewImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainViewImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainViewImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
    }
    
    fileprivate func setupTopContainerView() {
        topViewContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topViewContainerView)
        
        NSLayoutConstraint.activate([
            topViewContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topViewContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topViewContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topViewContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            ])
    }
    
    fileprivate func setupResultViewController() {
        scoreViewContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreViewContainer)
        scoreViewContainer.addSubview(ourViewContainer)
        scoreViewContainer.addSubview(theirViewContainer)
        scoreViewContainer.addSubview(appSettingsButton)
        
        NSLayoutConstraint.activate([
            scoreViewContainer.topAnchor.constraint(equalTo: topViewContainerView.bottomAnchor),
            scoreViewContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scoreViewContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scoreViewContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            
            appSettingsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -8),
            appSettingsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    fileprivate func setupUsViewContainer() {
        ourViewContainer.translatesAutoresizingMaskIntoConstraints = false
        scoreViewContainer.addSubview(ourScoreLabel)
        ourViewContainer.backgroundColor = .gray
        ourViewContainer.alpha = 0.3
        ourViewContainer.layer.cornerRadius = 16
        
        NSLayoutConstraint.activate([
            ourViewContainer.leadingAnchor.constraint(equalTo: scoreViewContainer.centerXAnchor, constant: 4),
            ourViewContainer.topAnchor.constraint(equalTo: ourScoreLabel.bottomAnchor, constant: 16),
            ourViewContainer.bottomAnchor.constraint(equalTo: scoreViewContainer.bottomAnchor),
            ourViewContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
            
            ])
    }
    
    fileprivate func setupThemViewContainer() {
        theirViewContainer.translatesAutoresizingMaskIntoConstraints = false
        scoreViewContainer.addSubview(theirScoreLabel)
        theirViewContainer.backgroundColor = .gray
        theirViewContainer.alpha = 0.3
        theirViewContainer.layer.cornerRadius = 16
        
        NSLayoutConstraint.activate([
            theirViewContainer.trailingAnchor.constraint(equalTo: scoreViewContainer.centerXAnchor, constant: -4),
            theirViewContainer.topAnchor.constraint(equalTo: theirScoreLabel.bottomAnchor, constant: 16),
            theirViewContainer.bottomAnchor.constraint(equalTo: scoreViewContainer.bottomAnchor),
            theirViewContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 8)
            ])
    }
    
    fileprivate func setupTableView() {
        usTableView.translatesAutoresizingMaskIntoConstraints = false
        scoreViewContainer.addSubview(usTableView)
        
        NSLayoutConstraint.activate([
            usTableView.leadingAnchor.constraint(equalTo: scoreViewContainer.leadingAnchor, constant: 8),
            usTableView.trailingAnchor.constraint(equalTo: scoreViewContainer.trailingAnchor, constant: -8),
            usTableView.topAnchor.constraint(equalTo: ourScoreLabel.bottomAnchor, constant: 16),
            usTableView.bottomAnchor.constraint(equalTo: scoreViewContainer.bottomAnchor),
            ])
    }
    
    fileprivate func setupButtonsAndLabeles() {
        
        NSLayoutConstraint.activate([
            recordResultButton.widthAnchor.constraint(equalToConstant: 128),
            recordResultButton.heightAnchor.constraint(equalToConstant: 44),
            theirTextField.widthAnchor.constraint(equalToConstant: 75),
            theirTextField.heightAnchor.constraint(equalToConstant: 32),
            ourTextField.widthAnchor.constraint(equalToConstant: 75),
            ourTextField.heightAnchor.constraint(equalToConstant: 32),
            ourScoreLabel.centerXAnchor.constraint(equalTo: scoreViewContainer.centerXAnchor, constant: 100),
            ourScoreLabel.topAnchor.constraint(equalTo: scoreViewContainer.topAnchor, constant: 8),
            theirScoreLabel.centerXAnchor.constraint(equalTo: scoreViewContainer.centerXAnchor, constant: -100),
            theirScoreLabel.topAnchor.constraint(equalTo: scoreViewContainer.topAnchor, constant: 8),
            ])
    }
    
    fileprivate func setupStackViews() {
        setupThemStackView()
        setupUsStackView()
        setupThemUsStackView()
        setupCenterStackViewContainer()
        setupResultStackView()
    }
    
    fileprivate func setupThemStackView() {
        themStackView = UIStackView(arrangedSubviews: [theirLabel, theirTextField])
        themStackView.axis = .vertical
        themStackView.alignment = .center
        themStackView.spacing = 20
        themStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func setupUsStackView() {
        ourStackView = UIStackView(arrangedSubviews: [ourLabel, ourTextField])
        ourStackView.axis = .vertical
        ourStackView.alignment = .center
        ourStackView.spacing = 20
        ourStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func setupThemUsStackView() {
        themUsStackView = UIStackView(arrangedSubviews: [themStackView, ourStackView])
        themUsStackView.axis = .horizontal
        themUsStackView.alignment = .center
        themUsStackView.distribution = .equalCentering
        themUsStackView.spacing = 8
        themUsStackView.translatesAutoresizingMaskIntoConstraints = false
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
    
    fileprivate func setupResultStackView() {
        
        let resultStackView = UIStackView(arrangedSubviews: [theirResultLabel, ourResultLabel])
        
        resultStackView.axis = .horizontal
        resultStackView.alignment = .center
        resultStackView.distribution = .equalCentering
        resultStackView.spacing = -100
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        
        topViewContainerView.addSubview(resultStackView)
        
        NSLayoutConstraint.activate([
            resultStackView.bottomAnchor.constraint(equalTo: topViewContainerView.bottomAnchor, constant: -8),
            resultStackView.widthAnchor.constraint(equalTo: topViewContainerView.widthAnchor, multiplier: 0.5),
            resultStackView.centerXAnchor.constraint(equalTo: topViewContainerView.centerXAnchor),
            ])
    }
    
    func disableViewColors() {
        topViewContainerView.backgroundColor = .clear
        scoreViewContainer.backgroundColor = .clear
        ourViewContainer.backgroundColor = .clear
        theirViewContainer.backgroundColor = .clear
    }
    
    private func getAttributes() -> [NSAttributedString.Key: Any] {
        let font = UIFont.systemFont(ofSize: 22)
        let color = UIColor.white
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color,
            .paragraphStyle: paragraphStyle
        ]
        return attributes
    }
}
