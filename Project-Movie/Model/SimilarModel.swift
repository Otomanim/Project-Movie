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
  
    let backdropPath: JSONNull?
    let id: Int?
    let posterPath: JSONNull?
    let popularity: Double?
    let title: String?
    
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
           
           case backdropPath
           case id
           case posterPath
           case popularity, title
           case voteCount
       }
}

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
