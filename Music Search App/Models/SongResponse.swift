  //
  //  SongResponse.swift
  //  Music Search App
  //
  //  Created by Pedro Couventaris Daspett on 06/04/22.
  //

import Foundation

struct SongResponse: Decodable {
  let songs: [Song]
  
  enum CodingKeys: String, CodingKey {
    case songs = "results"
  }
}
