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
//        return scoreBoard.count
        
//        guard let resultData = currentResultData else {
//            return 0
//        }
//        return resultData.count
        return ResultAPI.shared.getResults().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.usCellReuseIdentifier, for: indexPath) as! ResultCell
        cell.ourResultLabel.text = String(ResultAPI.shared.getResults()[indexPath.row].ourScore)
        cell.theirResultLabel.text = String(ResultAPI.shared.getResults()[indexPath.row].theirScore)
        if ResultAPI.shared.getResults().count > 1 {
            cell.showSeperatorViews()
        }
        return cell
    }
    
    func showDataForResult(at index: Int, for tableView: UITableView) {
        
        // defensive code: make sure the requested index is lower than the amount of resultss
        if (index < allResults.count && index > -1) {
            // fetch the result
            let result = allResults[index]
            // save the resultss data to present it later in the tableview
            currentResultData = result.tableRepresentation
        } else {
            currentResultData = nil
        }
        // we have the data we need, let's refresh our tableview
        reloadTableData(for: tableView)
    }
}
