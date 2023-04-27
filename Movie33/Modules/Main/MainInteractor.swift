//
//  MainInteractor.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import UIKit

// MARK: - Main Interactor Protocol
protocol MainInteractorProtocol {
  var presenter: MainPresenterProtocol? { get set }
  
  func getPopularMovies()
  func getUpcomingMovies()
  func getTopRatingMovies()
}

// MARK: - Main Interactor Class
final class MainInteractor: MainInteractorProtocol {
  var presenter: MainPresenterProtocol?
  
  // Get popular Movies
  func getPopularMovies() {
    APICaller.shared.getPopularMovies { [weak self] results in
      switch results {
      case .success(let movies):
        self?.presenter?.didFetchMovie(with: .success(movies))
      case .failure:
        self?.presenter?.didFetchMovie(with: .failure(NetworkError.failedTogetData))
      }
    }
  }
  
  // Get Upcoming Movies
  func getUpcomingMovies() {
    APICaller.shared.getUpcomingMovies { [weak self] results in
      switch results {
      case .success(let movies):
        self?.presenter?.didFetchMovie(with: .success(movies))
      case .failure:
        self?.presenter?.didFetchMovie(with: .failure(NetworkError.failedTogetData))
      }
    }
  }
  
  // Get Top Rating Movies
  func getTopRatingMovies() {
    APICaller.shared.getTopRatingMovies { [weak self] results in
      switch results {
      case .success(let movies):
        self?.presenter?.didFetchMovie(with: .success(movies))
      case .failure:
        self?.presenter?.didFetchMovie(with: .failure(NetworkError.failedTogetData))
      }
    }
  }
}
