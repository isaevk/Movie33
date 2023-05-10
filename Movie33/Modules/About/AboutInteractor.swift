//
//  AboutInteractor.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import Foundation

// MARK: - About Interactor Protocol
protocol AboutInteractorProtocol {
  var presenter: AboutPresenterProtocol? { get set }
  var networkManager: NetworkManagerProtocol? { get set }
  
  func getTrailers(movieName: String)
}

// MARK: - About Interactor Class
final class AboutInteractor: AboutInteractorProtocol {
  var presenter: AboutPresenterProtocol?
  var networkManager: NetworkManagerProtocol?
  
  func getTrailers(movieName: String) {
    networkManager?.getMovieOnYouTube(with: movieName + " trailer") { [weak self] result in
      switch result {
      case .success(let video):
        self?.presenter?.didFetchTrailer(with: .success(video))
      case .failure(let error):
        self?.presenter?.didFetchTrailer(with: .failure(error))
      }
    }
  }
}
