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
  var networkManager: NetworkManagerProtocol? { get set }
  
  func getPopularMovies()
  func getUpcomingMovies()
  func getTopRatingMovies()
}

// MARK: - Main Interactor Class
final class MainInteractor: MainInteractorProtocol {
  var presenter: MainPresenterProtocol?
  var networkManager: NetworkManagerProtocol?
  
  init?(networkManager: NetworkManagerProtocol) {
    self.networkManager = networkManager.getTopRatingMovies(complition: { [weak self] results in
      switch results {
      case .success(let movies):
        self?.presenter?.didFetchMovie(with: .success(movies))
      case .failure:
        self?.presenter?.didFetchMovie(with: .failure(NetworkError.failedTogetData))
      }
    }) as? any NetworkManagerProtocol
  }
                                                            
  
  
  // Get popular Movies
  func getPopularMovies() {
    networkManager?.getPopularMovies { [weak self] results in
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
    networkManager?.getUpcomingMovies { [weak self] results in
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
    networkManager?.getTopRatingMovies { [weak self] results in
      switch results {
      case .success(let movies):
        self?.presenter?.didFetchMovie(with: .success(movies))
      case .failure:
        self?.presenter?.didFetchMovie(with: .failure(NetworkError.failedTogetData))
      }
    }
  }
}
