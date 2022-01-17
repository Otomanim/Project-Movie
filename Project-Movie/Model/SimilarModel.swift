//
//  SimilarModel.swift
//  Project-Movie
//
//  Created by Evandro Rodrigo Minamoto on 16/01/22.
//

import Foundation

struct SimilarModel: Codable {
    let results: [Result]

    enum CodingKeys: String, CodingKey {
           case results
       }
}

struct Result: Codable {
  
    let popularity: Double?
    let title: String?
    let releaseDate: String?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
           
           case popularity, title
           case releaseDate
           case voteCount
       }
    
}

