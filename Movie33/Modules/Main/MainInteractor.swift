//
//  MainInteractor.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import Foundation

protocol MainInteractorProtocol {
  var presenter: MainPresenterProtocol? { get set }
  
  func getFilms()
}

final class MainInteractor: MainInteractorProtocol {
  var presenter: MainPresenterProtocol?
  
  
  // MARK: - Get Films
  func getFilms() {
    guard let url = URL(string: URLs.popular) else { return }
    
    let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
      guard let data = data, error == nil else {
        self?.presenter?.didFetchFilms(with: .failure(FetchError.falied))
        return
      }
      
      do {
        let films = try JSONDecoder().decode(Page.self, from: data)
        print(films.results.count)
        self?.presenter?.didFetchFilms(with: .success(films.results))

      }
      catch {
        print("error")
        self?.presenter?.didFetchFilms(with: .failure(error))
      }
    }
    
    task.resume()
  }
  // Get popular
  // Get top
  
}
