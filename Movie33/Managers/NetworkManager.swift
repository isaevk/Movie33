//
//  NetworkManager.swift
//  Movie33
//
//  Created by Kirill Dev on 26.04.2023.
//

import Foundation

// MARK: - Errors
enum NetworkError: Error {
  case failedTogetData
}

// MARK: - NetworkManagerProtocol
protocol NetworkManagerProtocol {
  func getPopularMovies(complition: @escaping (Result<[Movie], Error>) -> Void)
  func getUpcomingMovies(complition: @escaping (Result<[Movie], Error>) -> Void)
  func getTopRatingMovies(complition: @escaping (Result<[Movie], Error>) -> Void)
  func getMovieOnYouTube(with query: String, complition: @escaping (Result<Video, Error>) -> Void)
  
}

// MARK: - API Caller
final class NetworkManager: NetworkManagerProtocol {
  
  // MARK: - Popular
  func getPopularMovies(complition: @escaping (Result<[Movie], Error>) -> Void) {
    guard let url = URL(string: "\(URLs.baseTMDB)\(URLs.popularMovies)\(URLs.tokenTMDB)\(URLs.languageEN)") else { return }
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else { return }
      
      do {
        let result = try JSONDecoder().decode(MovieResponse.self, from: data)
        complition(.success(result.results))
      }
      catch {
        complition(.failure(NetworkError.failedTogetData))
      }
    }
    
    task.resume()
  }
  
  // MARK: - Upcoming
  func getUpcomingMovies(complition: @escaping (Result<[Movie], Error>) -> Void) {
    guard let url = URL(string: "\(URLs.baseTMDB)\(URLs.upcomingMovies)\(URLs.tokenTMDB)\(URLs.languageEN)") else { return }
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else { return }
      
      do {
        let result = try JSONDecoder().decode(MovieResponse.self, from: data)
        complition(.success(result.results))
      }
      catch {
        complition(.failure(NetworkError.failedTogetData))
      }
    }
    
    task.resume()
  }
  
  // MARK: - Top Rating
  func getTopRatingMovies(complition: @escaping (Result<[Movie], Error>) -> Void) {
    guard let url = URL(string: "\(URLs.baseTMDB)\(URLs.topRatingMovies)\(URLs.tokenTMDB)\(URLs.languageEN)") else { return }
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else { return }
      
      do {
        let result = try JSONDecoder().decode(MovieResponse.self, from: data)
        complition(.success(result.results))
      }
      catch {
        complition(.failure(NetworkError.failedTogetData))
      }
    }
    
    task.resume()
  }
  
  // MARK: - You Tube
  func getMovieOnYouTube(with query: String, complition: @escaping (Result<Video, Error>) -> Void) {
    
    guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
    guard let url = URL(string: "\(URLs.baseYouTubeSearch)q=\(query)&key=\(URLs.tokenYouTube)") else { return }
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else { return }
      
      do {
        let result = try JSONDecoder().decode(YouTubeResponse.self, from: data)
        complition(.success(result.items[0]))
      }
      catch {
        complition(.failure(error))
        print(error.localizedDescription)
      }
    }
    
    task.resume()
  }
}
