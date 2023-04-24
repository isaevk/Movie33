//
//  MainViewController.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import UIKit

protocol MainViewProtocol {
  var presenter: MainPresenterProtocol?  { get set }
  
  func update(with films: [Film])
  func update(with1 error: String)
}





final class MainViewController: UIViewController {
  // MARK: - Public Properties
  
  var presenter: MainPresenterProtocol?
  var films: [Film] = []
  
  // MARK: - Private Properties

  private var filmsCollectionView: UICollectionView!
  
  // MARK: - Override methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    
    view.backgroundColor = .systemBlue
    navigationController?.navigationBar.backgroundColor = .red
  }
  
  override func viewDidLayoutSubviews()  {
    super.viewDidLayoutSubviews()
    setupConstraints()
  }

  
  
  // MARK: - Private Methods
  
  private func setupConstraints() {
    filmsCollectionView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      filmsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      filmsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      filmsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      filmsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
    ])
  }
  
  // Setup Collection View
  private func setupCollectionView() {
    filmsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: setupCollectionViewLaout())
    filmsCollectionView.register(FilmCollectionViewCell.self, forCellWithReuseIdentifier: FilmCollectionViewCell.identifier)
    filmsCollectionView.isHidden = true
    filmsCollectionView.dataSource = self
    filmsCollectionView.delegate = self
    view.addSubview(filmsCollectionView)
    
  }

  // Layout
  private func setupCollectionViewLaout() -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: 70, height: 70)
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    return layout
  }
}

// MARK: - AnyView

extension MainViewController: MainViewProtocol {
  func update(with films: [Film]) {
    print("got films")
    DispatchQueue.main.async {
      self.films = films
      self.filmsCollectionView.reloadData()
      self.filmsCollectionView.isHidden = false
    }
  }

  func update(with1 error: String) {
    print(error)
  }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print(films.count)
    return films.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let filmCell = filmsCollectionView.dequeueReusableCell(withReuseIdentifier: FilmCollectionViewCell.identifier, for: indexPath) as? FilmCollectionViewCell else { return UICollectionViewCell() }
    filmCell.confugure(with: films[indexPath.row])
    return filmCell
  }
}


// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
  
}

