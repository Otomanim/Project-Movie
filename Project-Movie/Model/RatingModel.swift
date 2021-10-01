//
//  CountClass.swift
//  Project-Movie
//
//  Created by Evandro Rodrigo Minamoto on 01/10/21.
//

import Foundation

class RatingModel: NSObject {
    var vote_count: Int
    var popularity: Double
    
    init(vote_count: Int, popularity: Double) {
        self.vote_count = vote_count
        self.popularity = popularity
    }
}

