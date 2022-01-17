//
//  WecomeModels.swift
//  Project-Movie
//
//  Created by Evandro Rodrigo Minamoto on 16/01/22.
//

import Foundation

struct Welcome: Decodable {

    let popularity: Double
    let vote_Count: Int

    enum CodingKeys: String, CodingKey {
        
        case popularity = "popularity"
        case vote_Count = "vote_count"
    }

}
