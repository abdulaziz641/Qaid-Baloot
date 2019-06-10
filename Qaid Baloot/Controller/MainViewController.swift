//
//  MainViewController
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 15/03/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var currentResultIndex = 0
    var currentResultData: [ResultData]?
    var allResults = [Result]()
    
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
        allResults = ResultAPI.shared.getResults()
        showDataForResult(at: currentResultIndex, for: usTableView)
    }
    
    @objc private func setResult() {
        let usResult = Int(ourTextField.text!)!
        let themResult = Int(theirTextField.text!)!
        var roundResult = Result(ourScore: usResult, theirScore: themResult)
        var previousRoundResult = Result(ourScore: 0, theirScore: 0)
        
        guard (ourTextField.text != "0"  && theirTextField.text != "0") else {
            showAlert(title: "انتبه يالحبيب !", message: "ما يصلح تسجل صفر", buttonText: "سم ")
            return
        }
        
        if isNewGame {
            ResultAPI.shared.addResult(roundResult, at: 0)
            reloadTableData(for: usTableView)
            round += 1
            isNewGame = false
        } else {
            if ResultAPI.shared.getResults().count == 1 {
                previousRoundResult = ResultAPI.shared.getResults()[0]
            } else {
                previousRoundResult = ResultAPI.shared.getResults()[round - 1]
            }
            
            roundResult = roundResult + previousRoundResult
            ResultAPI.shared.addResult(roundResult, at: 1)
            reloadTableData(for: usTableView)
            round += 1
        }
        setResultLabels(ourResult: String(roundResult.ourScore), theirResult: String(roundResult.theirScore))
        resetTextFields()
    }
    
    private func setupTableView() {
        configure(tableView: usTableView, with: ResultCell.self, and: Constants.usCellReuseIdentifier, with: self, and: self)
    }
    
    private func configure(tableView: UITableView, with cell: UITableViewCell.Type, and reueIdentifier: String, with dataSource: UITableViewDataSource, and delegate: UITableViewDelegate) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.register(cell, forCellReuseIdentifier: reueIdentifier)
    }
    
    func reloadTableData(for tableView: UITableView) {
        if ResultAPI.shared.getResults().count > 0 {
            tableView.reloadData()
            tableView.scrollToRow(at: IndexPath(item: ResultAPI.shared.getResults().count - 1, section: 0), at: .bottom, animated: true)
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
}
