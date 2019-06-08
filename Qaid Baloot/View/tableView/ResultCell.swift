//
//  ResultCell.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 15/04/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit
class ResultCell: UITableViewCell {

    let ourResultLabel: UILabel = MainLabel(text: "", type: .defaultLabel)
    let theirResultLabel: UILabel = MainLabel(text: "", type: .defaultLabel)
    
    var ourSeperatorView: UIView = {
        let sepView = UIView()
        sepView.backgroundColor = .white
        sepView.isHidden = true
        sepView.translatesAutoresizingMaskIntoConstraints = false
        return sepView
    }()
    
    var theirSeperatorView: UIView = {
        let sepView = UIView()
        sepView.backgroundColor = .white
        sepView.isHidden = true
        sepView.translatesAutoresizingMaskIntoConstraints = false
        return sepView
    }()
    
    let containerView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    var ourStackView: UIStackView!
    private var theirStackView: UIStackView!
    private var mainStackView: UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupCellLayout()
    }
    
    private func setupCellLayout() {
        setupContainerView()
        setupOurStackView()
        setupTheirStackView()
        setupMainStackView()
    }
    
    func showSeperatorViews(){
        ourSeperatorView.isHidden = false
        theirSeperatorView.isHidden = false
    }
    
    private func setupLayout() {
        backgroundColor = .clear
        layer.cornerRadius = 16
        
        let tableViewStack = UIStackView(arrangedSubviews: [theirResultLabel, ourResultLabel])
        tableViewStack.translatesAutoresizingMaskIntoConstraints = false
        tableViewStack.distribution = .fillEqually
        tableViewStack.axis = .horizontal
        tableViewStack.alignment = .center
        tableViewStack.spacing = 180
        tableViewStack.backgroundColor = .clear
        
        addSubview(tableViewStack)
        addSubview(ourSeperatorView)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 44.0),
            tableViewStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableViewStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            ourSeperatorView.widthAnchor.constraint(equalTo: widthAnchor),
            ourSeperatorView.heightAnchor.constraint(equalToConstant: 0.7),
            ourSeperatorView.topAnchor.constraint(equalTo: tableViewStack.bottomAnchor, constant: 4),
            ourSeperatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
    }
    
    private func setupContainerView() {
        
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 44.0),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
    }
    
    private func setupMainStackView() {
        mainStackView = UIStackView(arrangedSubviews: [theirStackView, ourStackView])
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.distribution = .fillEqually
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        
        mainStackView.backgroundColor = .clear
        
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.widthAnchor.constraint(equalTo: containerView.widthAnchor)
            ])
    }
    
    private func setupOurStackView() {
        
        ourStackView = UIStackView(arrangedSubviews: [ourResultLabel, ourSeperatorView])
        ourStackView.axis = .vertical
        ourStackView.distribution = .equalCentering
        ourStackView.translatesAutoresizingMaskIntoConstraints = false
        ourStackView.alignment = .center
        ourStackView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            ourSeperatorView.centerXAnchor.constraint(equalTo: ourStackView.centerXAnchor),
            ourSeperatorView.widthAnchor.constraint(equalToConstant: 50),
            ourSeperatorView.heightAnchor.constraint(equalToConstant: 2.0),
            ourSeperatorView.topAnchor.constraint(equalTo: ourResultLabel.bottomAnchor, constant: 8)
            ])
    }
    
    private func setupTheirStackView() {
        theirStackView = UIStackView(arrangedSubviews: [theirResultLabel, theirSeperatorView])
        theirStackView.axis = .vertical
        theirStackView.distribution = .equalCentering
        theirStackView.translatesAutoresizingMaskIntoConstraints = false
        theirStackView.alignment = .center
        theirStackView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            theirSeperatorView.centerXAnchor.constraint(equalTo: theirStackView.centerXAnchor),
            theirSeperatorView.widthAnchor.constraint(equalToConstant: 50),
            theirSeperatorView.heightAnchor.constraint(equalToConstant: 2.0),
            theirSeperatorView.topAnchor.constraint(equalTo: theirResultLabel.bottomAnchor, constant: 8)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
