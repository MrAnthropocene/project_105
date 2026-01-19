//
//  ReadingStatus.swift
//  BookManager
//
//  Created by Saul Herrera on 1/18/26.
//
import Foundation

enum ReadingStatus: String, Codable, CaseIterable {
    case whantToRead = "Want to Read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    
    // base case
    case unknown = "Unknown"
}
