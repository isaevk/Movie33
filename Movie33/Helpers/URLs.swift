//
//  URLs.swift
//  Movie33
//
//  Created by Kirill Dev on 20.04.2023.
//

import Foundation

struct URLs {
  /// Movies API
  static let tokenTMDB = "e9267ba4312e3b05fe2d10707de27a5f"
  static let baseTMDB = "https://api.themoviedb.org"
  static let languageEN = "&language=en-US"
  static let image = "https://image.tmdb.org/t/p/w500/"
  /// Movie categories
  static let popularMovies = "/3/movie/popular?api_key="
  static let upcomingMovies = "/3/movie/upcoming?api_key="
  static let topRatingMovies = "/3/movie/top_rated?api_key="
  /// You Tube API
  static let tokenYouTube = "AIzaSyApQQwJgpIEIhBndat65VnTazJ4NegErwU"
  static let baseYouTubeSearch = "https://youtube.googleapis.com/youtube/v3/search?"
  static let baseYouTubeView = "https://www.youtube.com/embed/"
}

