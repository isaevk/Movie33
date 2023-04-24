//
//  ImageDownloaderManager.swift
//  Movie33
//
//  Created by Kirill Dev on 24.04.2023.
//

import UIKit

//MARK: - Image Downloader Manager
final class ImageDownloaderManager {
  static let shared = ImageDownloaderManager()
  private init() {}
  
  func fetchImage(from imageUrl: String?, with completion: @escaping (Result<UIImage, Error>) -> Void) {
    guard let stringUrl = imageUrl, let url = URL(string: stringUrl) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, responce, error) in
      if let error = error {
        completion(.failure(error))
      }
      
      if let data = data, let image = UIImage(data: data) {
        DispatchQueue.main.async {
          completion(.success(image))
        }
      }
    }.resume()
  }
}
