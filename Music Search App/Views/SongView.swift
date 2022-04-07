  //
  //  SongView.swift
  //  Music Search App
  //
  //  Created by Pedro Couventaris Daspett on 06/04/22.
  //

import SwiftUI

struct SongView: View {
  
  @StateObject var song: SongViewModel
  
  
  var body: some View {
    HStack {
      ArtworkView(image: song.artwork)
        .padding(.trailing)
      VStack (alignment: .leading) {
        Text(song.trackName)
        Text(song.artistName)
          .font(.footnote)
          .foregroundColor(.gray)
      }
      Spacer()
      Button {
        song.isFavorite = !song.isFavorite
      } label: {
        if song.isFavorite {
          Image(systemName: "heart.fill")
            .foregroundColor(.pink)
        } else {
          Image(systemName: "heart")
            .foregroundColor(.pink)
        }
      }
    }
    .padding()
  }
}
