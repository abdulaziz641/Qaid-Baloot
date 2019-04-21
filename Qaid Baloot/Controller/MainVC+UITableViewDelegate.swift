//
//  MainVC+UITableViewDelegate.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 17/04/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreBoard.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: usCellReuseIdentifier, for: indexPath) as! ResultCell
        
        if scoreBoard.count > 1 {
            cell.showSeperatorViews()
            cell.ourResultLabel.text = String(scoreBoard[indexPath.row].usResult)
            cell.theirResultLabel.text = String(scoreBoard[indexPath.row].themResult)
            cell.ourResultLabel.text = String(scoreBoard[indexPath.row].usResult)
        } else {
            cell.ourResultLabel.text = String(scoreBoard[indexPath.row].usResult)
            cell.theirResultLabel.text = String(scoreBoard[indexPath.row].themResult)
        }
        
        return cell
    }
}
