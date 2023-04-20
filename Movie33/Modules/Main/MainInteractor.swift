//
//  MainInteractor.swift
//  Movie33
//
//  Created by Kirill Dev on 20.04.2023.
//

import UIKit

final class MainInteractor: MainInteractorProtocol {
//  var presenter: MainPresenter?
  
  
  weak var presenter: MainPresenterProtocol?
//  let serverService: ServerServiceProtocol = .init()
  
  required init(presenter: MainPresenterProtocol!) {
    self.presenter = presenter
  }
  
  var setBackgroundColor: UIColor {
    get {
      return UIColor.white
    }
  }
  
  
  
  
  func openAboutFilm(with urlString: String) {
    //
  }
  
  
}
