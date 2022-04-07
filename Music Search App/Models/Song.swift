  //
  //  Song.swift
  //  Music Search App
  //
  //  Created by Pedro Couventaris Daspett on 06/04/22.
  //

import Foundation

struct Song: Decodable {
  let id: Int
  let trackName: String
  let artistName: String
  let artworkUrl60: String
  let artworkUrl100: String
  let artistViewUrl: String
  let collectionViewUrl: String
  let previewUrl: String
  
  
  enum CodingKeys: String, CodingKey {
    case id = "trackId"
    case trackName
    case artistName
    case artworkUrl60
    case artworkUrl100
    case artistViewUrl
    case collectionViewUrl
    case previewUrl
  }
}
