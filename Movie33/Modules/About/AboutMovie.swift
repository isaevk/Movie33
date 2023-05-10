//
//  AboutMovie.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import Foundation
 
// MARK: - About Movie Model
struct AboutMovie {
  /// Название фильма
  let nameMovie: String
  /// Оригинальное название
  let originalName: String
  /// Дата выхода в прокат
  let releaseDate: String
  /// Сюжет
  let overviewMovie: String
  /// Трейлер
  let youtubeView: Video
}
