//
//  AlbumModel.swift
//  AlbumiOSChallenge
//
//  Created by Ahmed on 27/03/2023.
//

import Foundation

struct Photo : Decodable {
    let id: String
    let urls: Urls
}
 
struct Urls: Decodable {
    let raw, full, regular, small: String
    let thumb, small_s3: String
}
 
