//
//  Movie-Network.swift
//  Project-Movie
//
//  Created by Evandro Rodrigo Minamoto on 27/09/21.
//

import Foundation
import Alamofire


class MovieNetwork{
    
    var arrayRating: [RatingModel] = []
    func getData(){
        
        var url: String = ""
        let api_key = "d088d687d6302295202f2cf641a161f4"

//        "https:api.themoviedb.org/3/movie/550?api_key=\(api_key)&callback=test"
        
        AF.request("https://api.themoviedb.org/3/movie/157336?api_key=\(api_key)&append_to_response=vote_count,popularity").responseJSON { response in
            if response.response?.statusCode == 200 {
                if let data = response.data {
                    do {
                        let result = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
                        print(result)
                                
                        let count = RatingModel (vote_count: result?.value(forKey: "vote_count" ) as! Int, popularity: result?.value(forKey: "popularity") as! Double)
                                self.arrayRating.append(count)
                                
                    }catch {
                        print(error)
                    }
                    print("============\(response.response?.statusCode)")
                }
        
            }else {
                print("====== Algo deu errado===========")
            }
        }
    }
}
