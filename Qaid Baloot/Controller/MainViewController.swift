//
//  ViewController.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 15/03/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: UI Views
    var topViewContainerView: UIView!
    var scoreViewContainer: UIView!
    var ourViewContainer: UIView!
    var theirViewContainer: UIView!
    
    var ourStackView: UIStackView!
    var themStackView: UIStackView!
    var themUsStackView: UIStackView!
    var centerStackViewContainer: UIStackView!
    var usThemResultStackView: UIStackView!
    
    var usTableView = ResultTableView()
    var theirTableView = ResultTableView()
    let usCellReuseIdentifier = "usReuseIdentifier"
    let themCellReuseIdentifier = "themReuseIdentifier"
    
    var scoreBoard: [Result]!
    
    let mainViewImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "brownWallPaper")
        iv.contentMode = .center
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    //MARK: UIButtons and Controls
    // Top view labels and buttons
    
    let ourLabel: UILabel = MainLabel(text: "لنا", type: .defaultLabel)
    let theirLabel: UILabel = MainLabel(text: "لهم", type: .defaultLabel)
    let recordResultButton: UIButton = MainAppButton(buttonType: .defaultButton, title: "قيد")
    let ourTextField: UITextField = MainAppTextField(text: "0", type: .defaultType)
    let theirTextField: UITextField = MainAppTextField(text: "0", type: .defaultType)
    var ourResultLabel: UILabel = MainLabel(text: "0", type: .resultLabel)
    var theirResultLabel: UILabel = MainLabel(text: "0", type: .resultLabel)
    
    // Score view buttons and labels
    
    let ourScoreLabel: UILabel = MainLabel(text: "لنا", type: .defaultLabel)
    let theirScoreLabel: UILabel = MainLabel(text: "لهم", type: .defaultLabel)
    
    var round: Int = 0
    var isNewGame = true
    var isReset = false
    
    let appSettingsButton: UIButton = MainAppButton(buttonType: .settingsButton, title: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupTableView()
        recordResultButton.addTarget(self, action: #selector(setResult), for: .touchUpInside)
    }
    
    @objc private func setResult() {
        let usResult = Int(ourTextField.text!)!
        let themResult = Int(theirTextField.text!)!
        var roundResult = Result(usResult: usResult, themResult: themResult)
        var previousRoundResult = Result(usResult: 0, themResult: 0)
        
        if isNewGame {
            scoreBoard.append(roundResult)
            reloadTableData()
            round += 1
            isNewGame = false
        } else {
            if scoreBoard.count == 1 {
                previousRoundResult = scoreBoard[0]
            } else {
                previousRoundResult = scoreBoard[round - 1]
            }
            
            roundResult = roundResult + previousRoundResult
            scoreBoard.append(roundResult)
            reloadTableData()
            round += 1
        }
        setResultLabels(ourResult: String(roundResult.usResult), theirResult: String(roundResult.themResult))
        resetTextFields()
    }
    
    private func setupTableView() {
        configure(tableView: usTableView, with: ResultCell.self, and: usCellReuseIdentifier, with: self, and: self)
        scoreBoard = []
    }
    
    private func configure(tableView: UITableView, with cell: UITableViewCell.Type, and reueIdentifier: String, with dataSource: UITableViewDataSource, and delegate: UITableViewDelegate) {
        usTableView.delegate = delegate
        usTableView.dataSource = dataSource
        usTableView.register(cell, forCellReuseIdentifier: usCellReuseIdentifier)
    }
    
    private func reloadTableData() {
        if scoreBoard.count > 0 {
            usTableView.reloadData()
            usTableView.scrollToRow(at: IndexPath(item:scoreBoard.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
    
    private func resetTextFields() {
        ourTextField.text = "0"
        theirTextField.text = "0"
    }
    
    private func setResultLabels(ourResult: String, theirResult: String) {
        ourResultLabel.text = ourResult
        theirResultLabel.text = theirResult
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
