//
//  MediaType.swift
//  Music Search App
//
//  Created by Pedro Couventaris Daspett on 06/04/22.
//

import Foundation

 enum MediaType: String, CaseIterable, Identifiable {
     case music, movie, tvShow

     var title: String {
         switch self {

         case .music:
             return "Music"
         case .movie:
             return "Movie"
         case .tvShow:
             return "TV Show"
         }
     }

     var id: String { self.rawValue }
 }
