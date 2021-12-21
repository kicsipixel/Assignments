//
//  AlbumsViewModel.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import Combine
import SwiftUI

final class AlbumsViewModel: ObservableObject {
    
    @Published var album: Album? = nil
}
