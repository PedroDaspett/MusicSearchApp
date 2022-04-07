  //
  //  ContentView.swift
  //  Music Search App
  //
  //  Created by Pedro Couventaris Daspett on 05/04/22.
  //

import SwiftUI

struct ContentView: View {
  enum TabItem: String {
    case search, favorites
  }
  
  @ObservedObject var viewModel: SongListViewModel
  
  var body: some View {
    TabView {
      search
      favorites
    }
    .accentColor(.pink)
  }
  
  var search: some View {
    NavigationView {
      VStack {
        SearchBar(searchTerm: $viewModel.searchTerm)
        if viewModel.songs.isEmpty {
          EmptyStateView()
        } else {
          List(viewModel.songs) { song in
            SongView(song: song)
          }
          .listStyle(PlainListStyle())
        }
      }
      .navigationTitle("Music Search")
    }
    .tabItem {
      Image(systemName: "magnifyingglass")
      Text("Search")
    }
    .tag(TabItem.search)
  }
  
  var favorites: some View {
    NavigationView {
      VStack{}
        .navigationTitle("Favorites")
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .tabItem {
      Image(systemName: "heart")
      Text("Favorites")
    }
    .tag(TabItem.favorites)
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(viewModel: SongListViewModel())
  }
}
