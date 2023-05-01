//
//  MovieResponse.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import Foundation

// MARK: - MovieResponse Model
struct MovieResponse: Codable  {
    let results: [Movie]
  
  enum CodingKeys: String, CodingKey {
      case results
  }
}

// MARK: - Movie Model
struct Movie: Codable, Hashable {
  /// Название
  let title: String?
  /// Сюжет
  let overview: String?
  /// Постер
  let posterPath: String?
  /// Дата релиза
  let releaseDate: String?
  /// Оригинальное название
  let originalTitle: String?
  /// Рейтинг
  let voteAverage: Double?
  
  enum CodingKeys: String, CodingKey {
    case title
    case overview
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case originalTitle = "original_title"
    case voteAverage = "vote_average"
  }

}

