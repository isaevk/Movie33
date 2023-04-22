//
//  MainInteractor.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import Foundation

final class MainInteractor: MainInteractorProtocol {
  var presenter: MainPresenterProtocol?
  
  
  // MARK: - Get Films
  func getFilms() {
    guard let url = URL(string: URLs.popular) else { return }
    let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
      guard let data = data, error == nil else {
        self?.presenter?.didFetchFilms(with: .failure(FetchError.falied))
        return
      }
      
      do {
        let films = try JSONDecoder().decode([Film].self, from: data)
        self?.presenter?.didFetchFilms(with: .success(films))
      }
      catch {
        
        self?.presenter?.didFetchFilms(with: .failure(error))
      }
      
    }
    
    task.resume()
  }
  
  
}
