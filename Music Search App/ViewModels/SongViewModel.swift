  //
  //  SongViewModel.swift
  //  Music Search App
  //
  //  Created by Pedro Couventaris Daspett on 06/04/22.
  //

import Foundation
import SwiftUI

class SongViewModel: Identifiable, ObservableObject {
  let id: Int
  let trackName: String
  let artistName: String
  var isFavorite: Bool
  @Published var artwork: Image?
  
  init (song: Song) {
    self.id = song.id
    self.trackName = song.trackName
    self.artistName = song.artistName
    self.isFavorite = false
  }
}
