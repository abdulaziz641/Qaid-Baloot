//
//  ResultsLibrary.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 27/04/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation

final class LibraryAPI {
    
    static let shared = LibraryAPI()
    private let persistencyManager = PersistencyManager()
    private let httpClient = HTTPClient()
    private let isOnline = false
    
    private init() {
        
    }
    
    func getResults() -> [Result] {
        return persistencyManager.getResults()
    }
    
    func addResult(_ result: Result, at index: Int) {
        persistencyManager.addResult(result, at: index)
        if isOnline {
            httpClient.postRequest("/api/addAlbum", body: result.description)
        }
    }
    
    func deleteResult(at index: Int) {
        persistencyManager.deleteResult(at: index)
        if isOnline {
            httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
        }
    }
}
