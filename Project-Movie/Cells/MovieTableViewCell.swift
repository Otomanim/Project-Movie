//
//  MovieTableViewCell.swift
//  Project-Movie
//
//  Created by Evandro Rodrigo Minamoto on 27/09/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func setup(value: Result){
        self.titleLabel.text = value.title
//        self.movieImageView.image = value.posterPath
    }
    
}
