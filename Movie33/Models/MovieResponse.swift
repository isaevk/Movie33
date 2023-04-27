//
//  MovieResponse.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import Foundation

// MARK: - MovieResponse Model
struct MovieResponse: Codable {
    let results: [Movie]
}

// MARK: - Movie Model
struct Movie: Codable, Hashable {
  /// Название
  let title: String?
  /// Сюжет
  let overview: String?
  /// Постер
  let poster_path: String?
  /// Дата релиза
  let release_date: String?
  /// Оригинальное название
  let original_title: String?
  /// Рейтинг
  let vote_average: Double?
}
