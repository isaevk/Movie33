//
//  MainViewController.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import UIKit

// MARK: - Main View Protocol
protocol MainViewProtocol {
  var presenter: MainPresenterProtocol?  { get set }
  
  func update(with movies: [Movie])
  func update(with error: String)
}

// MARK: - Main View Class
final class MainViewController: UIViewController {
  
  // MARK: - Public Properties
  var presenter: MainPresenterProtocol?
  
  // MARK: - Private Properties
  private var filmsCollectionView: UICollectionView!
  private var topMenu = UIMenu()
  private let errorLabel = UILabel()
  
  private let titleNavBar = CustomTitle(title: "Movie33")
  private var movies: [Movie] = []
  
  // MARK: - Override methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override func viewDidLayoutSubviews()  {
    super.viewDidLayoutSubviews()
    setupConstraints()
  }
  
  // MARK: - Private Methods
  private func setupView() {
    view.backgroundColor = .systemCyan
    navigationItem.backButtonTitle = ""
    setupCollectionView()
    setupTopMenu()
    setupNavigationBar()
    setupLabel()
  }
}

// MARK: - Settings
private extension MainViewController {
  
  // Top menu
  func setupTopMenu() {
    
    let popular = UIAction(title: "Popular", image: UIImage(systemName: "eyeglasses")) { [weak self] _ in
      self?.presenter?.selectedPopularMovies()
      
      DispatchQueue.main.async {
        self?.filmsCollectionView.reloadData()
      }
    }
    
    let upcoming = UIAction(title: "Upcoming", image: UIImage(systemName: "calendar.badge.clock")) { [weak self] _ in
      self?.presenter?.selectedUpcomingMovies()
      
      DispatchQueue.main.async {
        self?.filmsCollectionView.reloadData()
      }
    }
    
    let topRating = UIAction(title: "Top Rating", image: UIImage(systemName: "text.line.first.and.arrowtriangle.forward")) { [weak self]_ in
      self?.presenter?.selectedTopRatingMovie()
      
      DispatchQueue.main.async {
        self?.filmsCollectionView.reloadData()
      }
    }
    
    let subMenuPopular = UIMenu(options: .displayInline, children: [popular])
    let submenuTopRating = UIMenu(options: .displayInline, children: [topRating])
    
    topMenu = UIMenu(title: "Movie selections", children: [subMenuPopular, upcoming, submenuTopRating])
  }
  
  // Navigation bar
  func setupNavigationBar() {
    let barItemRight = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), menu: topMenu)
    barItemRight.changesSelectionAsPrimaryAction = true
    
    navigationItem.rightBarButtonItem = barItemRight
    navigationController?.navigationBar.tintColor = .systemGray6
    navigationController?.hidesBottomBarWhenPushed = true
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.titleView = titleNavBar
  }
  
  // Label
  func setupLabel() {
    errorLabel.center = view.center
    errorLabel.frame = CGRect(x: view.center.x, y: view.center.y, width: 200, height: 50)
    errorLabel.textAlignment = .center
    errorLabel.isHidden = true
    view.addSubview(errorLabel)
  }
  
  // Collection View
  func setupCollectionView() {
    filmsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: setupCollectionViewLaout())
    filmsCollectionView.register(FilmCollectionViewCell.self, forCellWithReuseIdentifier: FilmCollectionViewCell.identifier)
    filmsCollectionView.backgroundColor = .systemCyan
    filmsCollectionView.isHidden = true
    filmsCollectionView.dataSource = self
    filmsCollectionView.delegate = self
    view.addSubview(filmsCollectionView)
  }
  
  // Collection View Layout
  func setupCollectionViewLaout() -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: view.bounds.width - 16, height: 620)
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    return layout
  }
  
  // Constraints
  private func setupConstraints() {
    filmsCollectionView.translatesAutoresizingMaskIntoConstraints = false
    //    titleNavBar.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      filmsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      filmsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      filmsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      filmsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
    ])
  }
}

// MARK: - Main View Protocol

extension MainViewController: MainViewProtocol {
  func update(with movies: [Movie]) {
    DispatchQueue.main.async { [weak self] in
      self?.movies = movies
      self?.filmsCollectionView.reloadData()
      self?.filmsCollectionView.isHidden = false
    }
  }
  
  func update(with error: String) {
    DispatchQueue.main.async { [weak self] in
      self?.movies = []
      self?.errorLabel.text = error
      self?.filmsCollectionView.isHidden = true
      self?.errorLabel.isHidden = false
    }
  }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let movieCell = filmsCollectionView.dequeueReusableCell(withReuseIdentifier: FilmCollectionViewCell.identifier, for: indexPath) as? FilmCollectionViewCell else { return UICollectionViewCell() }
    movieCell.confugure(with: movies[indexPath.row])
    return movieCell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    
    let movie = movies[indexPath.row]
    
    guard let movieName = movie.title,
          let movieOverview = movie.overview,
          let movieOrifinalName = movie.original_title,
          let movieReleseDate = movie.release_date else { return }
    
    APICaller.shared.getMovieOnYouTube(with: movieName + " trailer") { [weak self] result in
      switch result {
      case .success(let video):
        let videoModel = AboutMovie(nameMovie: movieName, originalName: movieOrifinalName , releaseDate: movieReleseDate,overviewMovie: movieOverview, youtubeView: video)
        
        self?.presenter?.movieCellClicked(with: videoModel)
      case .failure(let error):
        print(error)
      }
    }
  }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate { }
