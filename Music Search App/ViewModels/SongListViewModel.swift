  //
  //  SongListViewModel.swift
  //  Music Search App
  //
  //  Created by Pedro Couventaris Daspett on 05/04/22.
  //

import Foundation
import SwiftUI
import Combine

class SongListViewModel: ObservableObject {
  
  @Published var searchTerm: String = ""
  @Published public private(set) var songs: [SongViewModel] = []
  
  private let apiRequest: APIRequest = APIRequest()
  private let artworkLoader: ArtworkLoader = ArtworkLoader()
  private var disposables = Set<AnyCancellable>()
  
  init() {
    $searchTerm
      .sink(receiveValue: loadSongs(searchTerm:))
      .store(in: &disposables)
  }
  
  private func loadSongs(searchTerm: String) {
    songs.removeAll()
    artworkLoader.reset()
    apiRequest.loadSongs(searchTerm: searchTerm) {songs in
      songs.forEach { self.appendSong(song: $0) }
    }
  }
  
  private func appendSong(song: Song) {
    let songViewModel = SongViewModel(song: song)
    DispatchQueue.main.async {
      self.songs.append(songViewModel)
    }
    artworkLoader.loadArtwork(forSong: song) { image in
      DispatchQueue.main.async {
        songViewModel.artwork = image
      }
    }
  }
}
