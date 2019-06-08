//
//  String+Int.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 26/04/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation

extension String {
    func toInt(defaultValue: Int) -> Int {
        if let n = Int(self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)) {
            return n
        } else {
            return defaultValue
        }
    }
}
