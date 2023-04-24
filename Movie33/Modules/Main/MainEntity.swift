//
//  MainEntity.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import Foundation

// MARK: - Errors
enum FetchError: Error {
  case falied
}

// MARK: - Page
struct Page: Codable {
    let page: Int?
    let results: [Film]
    let totalPages, totalResults: Int?
}

// MARK: - Result
struct Film: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ko = "ko"
}
