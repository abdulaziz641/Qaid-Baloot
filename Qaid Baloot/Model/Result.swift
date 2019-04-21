//
//  Result.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 06/04/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation

struct Result: Equatable {
    let usResult: Int
    let themResult: Int
    
    func calculateResult() -> (Int, Int) {
        return (usResult, themResult)
    }
    
    static func +(lhs: Result, rhs: Result) -> Result {
        return Result(usResult: lhs.usResult + rhs.usResult, themResult: lhs.themResult + rhs.themResult)
    }
}
