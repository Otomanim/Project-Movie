//
//  Movie-Model.swift
//  Project-Movie
//
//  Created by Evandro Rodrigo Minamoto on 27/09/21.
//

import Foundation

struct Result: Codable {
    let success: Bool
    let data: Data
}

struct Data: Codable {
    let welcome: [Welcome]
}

struct Welcome: Codable {

    let popularity: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        
        case popularity = "popularity"
        case voteCount = "vote_count"
    }

}



