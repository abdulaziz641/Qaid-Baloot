//
//  ResultTableViewController.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 08/04/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit

class ResultTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        tableViewDefaults()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tableViewDefaults() {
        backgroundColor = .clear
        allowsSelection = false
        separatorStyle = .none
    }
}
