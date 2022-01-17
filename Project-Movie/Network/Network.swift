//
//  Movie-Network.swift
//  Project-Movie
//
//  Created by Evandro Rodrigo Minamoto on 27/09/21.
//

import Foundation
import Alamofire

class Network{
    
    var popularity: Double = 0
    var vote_count: Int = 0
    var movieSimilar [] = []
    func getMovie(completion: @escaping (Bool, Error?) -> Void ){
        
        var api_key = "d088d687d6302295202f2cf641a161f4"
        var url: String = "https://api.themoviedb.org/3/movie/123?api_key=\(api_key)"
        
        AF.request(url).responseJSON { response in
            if let data = response.data {
                do {
                    let result: Welcome = try JSONDecoder().decode(Welcome.self, from: data)
                    self.popularity = result.popularity.self
                    self.vote_count = result.vote_Count.self
                    completion(true, nil)
                } catch {
                    completion(false, error)
                }
            }
        }
    }
    
    func getMovieSimilar(completion: @escaping (Bool, Error?) -> Void ){
        
    }
}
