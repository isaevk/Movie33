//
//  URLs.swift
//  Movie33
//
//  Created by Kirill Dev on 20.04.2023.
//

import Foundation

enum URLs {
  static let baseURL = "https://api.themoviedb.org/3/movie/"
  static let api_key = "api_key=e9267ba4312e3b05fe2d10707de27a5f"
  static let languageEn = "&language=en-US"
  
  static let popular = "https://api.themoviedb.org/3/movie/popular?api_key=e9267ba4312e3b05fe2d10707de27a5f&language=en-US"
  static let upcoming = "https://api.themoviedb.org/3/movie/upcoming?api_key=e9267ba4312e3b05fe2d10707de27a5f&language=en-US"
  static let topRating = "https://api.themoviedb.org/3/movie/top_rated?api_key=e9267ba4312e3b05fe2d10707de27a5f&language=en-US"
  
}

enum ClassificationFilms {
  static let popular = "popular?"
  static let upcoming = "upcoming?"
  static let topRating = "topRating?"
}


final class NetWorkMeneger {
  
}
