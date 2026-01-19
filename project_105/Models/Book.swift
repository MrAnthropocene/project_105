//
//  ReadingStatus.swift
//  BookManager
//
//  Created by Saul Herrera on 1/18/26.
//
import Foundation

struct Book: Hashable {
    let id: UUID = UUID()
    var title: String
    var author: String
    var details: String
    var cover: String
    var review: String
    var rating: Int
    var genre: Genre = .unknown
    var readingStatus: ReadingStatus = .unknown
    
    var isFavorite: Bool = false
}



//struct Book: Hashable {
//    let id: UUID = UUID()
//    var title: String
//    var author: String
//    var details: String
//    var releaseDate: Date
//    var editorial: String
//    var genre: String
//    var rating: Int
//    var cover:  String
//    var review: String
//    
//}
