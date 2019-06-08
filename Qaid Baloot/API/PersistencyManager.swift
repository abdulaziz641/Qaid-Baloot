//
//  PersistencyManager.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 27/04/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation

final class PersistencyManager {
    private var results = [Result]()
    
    init() {
        
    }
    
    func getResults() -> [Result] {
        return results
    }
    
    func addResult(_ result: Result, at index: Int) {
        if (results.count == index) {
            results.insert(result, at: index)
        } else {
            results.append(result)
        }
    }
    
    func deleteResult(at index: Int) {
        results.remove(at: index)
    }
}
