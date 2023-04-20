//
//  MainViewController.swift
//  Movie33
//
//  Created by Kirill Dev on 20.04.2023.
//

import UIKit

final class MainViewController: UIViewController {
  
  private var filmsCollectionView: UICollectionView!
  private let burgerSideMenu = UINavigationItem()
  
  var presenter: MainPresenterProtocol?
  let configuretor: MainConfiguratorProtocol = MainConfigurator()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    
    configuretor.configure(with: self)
    presenter?.configureView()
    
//    setupCollectionView()
    
    navigationController?.navigationBar.backgroundColor = .cyan
  }
  
  
  // MARK: - Setup CollectionView
  private func setupCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: 70, height: 70)
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    filmsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    filmsCollectionView.register(FilmCollectionViewCell.self, forCellWithReuseIdentifier: FilmCollectionViewCell.identifier)
    

    filmsCollectionView.dataSource = self
    filmsCollectionView.delegate = self

    
    
//    filmsCollectionView.translatesAutoresizingMaskIntoConstraints = false
//
//    NSLayoutConstraint.activate([
//      filmsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//      filmsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//      filmsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//      filmsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//    ])
    
    view.addSubview(filmsCollectionView)
  }


}


// MARK: - MainViewProtocol

extension MainViewController: MainViewProtocol {

  
  func setBackgroundView(with color: UIColor) {
    view.backgroundColor = color
  }
  
  func setBurgerSidemenu(with navItem: UINavigationItem) {
    //
  }
  
}



// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let filmCell = filmsCollectionView.dequeueReusableCell(withReuseIdentifier: FilmCollectionViewCell.identifier, for: indexPath) as? FilmCollectionViewCell else { return UICollectionViewCell() }
    return filmCell
  }
  
  
}


// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
  
}
