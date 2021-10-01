//
//  MovieTableViewCell.swift
//  Project-Movie
//
//  Created by Evandro Rodrigo Minamoto on 27/09/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
//    MARK: - Outlet
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
