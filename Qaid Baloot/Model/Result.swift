//
//  Result.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 06/04/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation

struct Result: Equatable {
    let ourScore: Int
    let theirScore: Int
    
    func calculateResult() -> (Int, Int) {
        return (ourScore, theirScore)
    }
    
    static func +(lhs: Result, rhs: Result) -> Result {
        return Result(ourScore: lhs.ourScore + rhs.ourScore, theirScore: lhs.theirScore + rhs.theirScore)
    }
}

extension Result: CustomStringConvertible {
    var description: String {
        return "ourScore: \(ourScore) theirScore: \(theirScore)"
    }
}

typealias ResultData = (ourResult: String, theirResult: String)

extension Result {
    var tableRepresentation: [ResultData] {
        return [
            ("ourResult", String(ourScore)),
            ("theirResult", String(theirScore))
        ]
    }
}
