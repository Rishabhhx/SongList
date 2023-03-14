//
//  Model.swift
//  likeMinds
//
//  Created by Rishabh Sharma on 14/03/23.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let artistName : String?
    let artworkUrl100 : String?
    let trackName: String?
    let description: String?
    let trackPrice: Double?
    
    enum CodingKeys: String, CodingKey {
        case artistName, trackName, description, trackPrice
        case artworkUrl100
    }
}
