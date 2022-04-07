  //
  //  EmptyStateView.swift
  //  Music Search App
  //
  //  Created by Pedro Couventaris Daspett on 06/04/22.
  //

import SwiftUI

struct EmptyStateView: View {
  var body: some View {
    VStack {
      Spacer()
      Image(systemName: "music.note")
        .font(.system(size: 85))
        .padding(.bottom)
      Text("Let's search for music!")
        .font(.title)
      Spacer()
    }
    .padding()
    .foregroundColor(.pink)
  }
}

struct EmptyStateView_Previews: PreviewProvider {
  static var previews: some View {
    EmptyStateView()
  }
}
