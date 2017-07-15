//
//  Song.swift
//  KpopSuggestion
//
//  Created by Justin Artis on 6/14/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import Foundation
import UIKit

class Song {
    var songName: String
    var albumName: String
    var artistName: String
    var albumImage: String
    
    init(song: String,album: String,artist: String,image: String) {
        self.songName = song
        self.albumName = album
        self.artistName = artist
        self.albumImage = image
    }
    
    func getSong() -> String {
        return self.songName
    }
    
    func getAlbum() -> String {
        return self.albumName
    }
    
    func getArtist() -> String {
        return self.artistName
    }
    
}
