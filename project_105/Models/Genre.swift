//
//  ReadingStatus.swift
//  BookManager
//
//  Created by Saul Herrera on 1/18/26.
//
import Foundation

enum Genre: String, Codable, CaseIterable {
    case classic = "Classic"
    case fantasy = "Fantasy"
    case drama = "Drama"
    case scienceFiction = "Science Fiction"
    case mystery = "Mystery"
    case horror = "Horror"
    
    
    // base case
    case unknown = "Unknown"
}
