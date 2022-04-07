  //
  //  ArtworkView.swift
  //  Music Search App
  //
  //  Created by Pedro Couventaris Daspett on 06/04/22.
  //

import SwiftUI

struct ArtworkView: View {
  let image: Image?
  
  var body: some View {
    ZStack {
      if image != nil {
        image
      } else {
        Color(.systemIndigo)
        Image(systemName: "music.note")
          .font(.largeTitle)
          .foregroundColor(.white)
      }
    }
    .frame(width: 50, height: 50)
    .shadow(radius: 5)
    .padding(.trailing, 5)
  }
}

struct ArtworkView_Previews: PreviewProvider {
  static var previews: some View {
    ArtworkView(image: Image(systemName: "photo"))
  }
}
