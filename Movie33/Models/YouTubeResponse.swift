//
//  YouTubeResponse.swift
//  Movie33
//
//  Created by Kirill Dev on 26.04.2023.
//

import Foundation

// MARK: - YouTubeResponse Model
struct YouTubeResponse: Codable {
  let items: [Video]
}

// MARK: - Video Model
struct Video: Codable {
  let id: IdVideo
}

// MARK: - IdVideo Model
struct IdVideo: Codable {
  let videoId: String
}
