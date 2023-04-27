//
//  FilmCollectionViewCell.swift
//  Movie33
//
//  Created by Kirill Dev on 20.04.2023.
//

import UIKit
import Kingfisher

final class FilmCollectionViewCell: UICollectionViewCell {
  static let identifier = "FilmCell"
  
  // MARK: - Private Properties
  private let posterImageView = UIImageView()
  private let ratingLabel = UILabel()
  
  // MARK: - Override init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Override methods
  override func layoutSubviews() {
    super.layoutSubviews()
    setupConstraints()
  }

  // MARK: - Private Methods
  private func setupView() {
    setupUI()
  }
  
  // MARK: - Public methods
  func confugure(with movie: Movie) {
    guard let image = movie.poster_path,
    let rating = movie.vote_average else {
      posterImageView.image = UIImage(systemName: "shareplay.slash")
      ratingLabel.text = "Error"
      return
    }
    
    guard let url = URL(string: "\(URLs.image)\(image)") else { return }
    posterImageView.kf.setImage(with: url)
    
    ratingLabel.text = String(rating)
  }
}

// MARK: - Settings

private extension  FilmCollectionViewCell {
  
  // Constraints
  private func setupConstraints() {
    [posterImageView, ratingLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      posterImageView.topAnchor.constraint(equalTo: topAnchor),
      posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
      
      ratingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      ratingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      ratingLabel.widthAnchor.constraint(equalToConstant: 40),
      ratingLabel.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
  
  // UI
  func setupUI() {
    backgroundColor = .systemCyan
    
    posterImageView.clipsToBounds = true
    posterImageView.layer.cornerRadius = 25
    posterImageView.contentMode = .scaleAspectFill
    
    let size: CGFloat = 35.0

    ratingLabel.bounds = CGRectMake(0.0, 0.0, size, size)
    ratingLabel.layer.cornerRadius = size / 2
    ratingLabel.layer.borderWidth = 2.0
    ratingLabel.layer.backgroundColor = UIColor.clear.cgColor
    ratingLabel.layer.borderColor = UIColor.systemYellow.cgColor
    ratingLabel.textAlignment = .center
    ratingLabel.font = .boldSystemFont(ofSize: 18)
    ratingLabel.textColor = .white
  }
}
