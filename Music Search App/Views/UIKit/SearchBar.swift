  //
  //  SearchBar.swift
  //  Music Search App
  //
  //  Created by Pedro Couventaris Daspett on 06/04/22.
  //
  //  UISearchBar faz parte do UIKit, precisamos de uma subclasse UIViewRepresentable
  //  para trazer o UIKitView para SwiftUIView
  //  typealias diz para Xcode qual tipo do UIView
  //  o UIViewRepresentable vai pertencer

import SwiftUI
import Foundation

struct SearchBar: UIViewRepresentable {
  
  typealias UIViewType = UISearchBar
  @Binding var searchTerm: String
  
  func makeUIView(context: Context) -> UISearchBar {
    let searchBar = UISearchBar(frame: .zero)
    searchBar.delegate = context.coordinator
    searchBar.searchBarStyle = .minimal
    searchBar.placeholder = "Type a song, album name or artist... "
    return searchBar
  }
  func updateUIView(_ uiView: UISearchBar, context: Context) {
  }
  func makeCoordinator() -> SearchBarCoordinator {
    return SearchBarCoordinator(searchTerm: $searchTerm)
  }
  class SearchBarCoordinator: NSObject, UISearchBarDelegate {
    @Binding var searchTerm: String
    init (searchTerm: Binding<String>) {
      self._searchTerm = searchTerm
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      searchTerm = searchBar.text ?? ""
      UIApplication
        .shared
        .connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .flatMap { $0.windows }
        .first { $0.isKeyWindow }?
        .endEditing(true)
    }
  }
}

