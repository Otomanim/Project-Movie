//
//  ViewController.swift
//  Project-Movie
//
//  Created by Evandro Rodrigo Minamoto on 27/09/21.
//

import UIKit

class ViewController: UIViewController {

    var movieNetwork = Network()
    var checked = false
  
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var vote_countLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieNetwork.getMovie { [self] result, error in
            if result {
                self.popularityLabel.text = String(movieNetwork.popularity)
                self.vote_countLabel.text = String(movieNetwork.vote_count) + " " + "Likes"
            } else {
                print (error?.localizedDescription ?? "Error Movie Network")
            }
        }
        self.movieNetwork.getMovieSimilar { result, error in
            if result {
                self.myTableView.reloadData()
            } else {
                print (error?.localizedDescription ?? "Error Similar Network")
            }
        }
              
        self.detailImageView.addBlackGradientLayerInBackground(frame: detailImageView.frame, colors: [.clear, .black])
        self.myTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
    }

    @IBAction func heartButton(_ sender: UIButton) {
        if checked {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            checked = false
        } else {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            checked = true
        }
    }
    
    func getCount() -> Int{
        return self.movieNetwork.arraySimilar.count
    }
    
    func getCharacter(indexPath: IndexPath) -> Result{
        return self.movieNetwork.arraySimilar[indexPath.row]
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MovieTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
        cell?.setup(value: getCharacter(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }
}

extension UIView{
   
   func addBlackGradientLayerInForeground(frame: CGRect, colors:[UIColor]){
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.addSublayer(gradient)
   }
 
   func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.insertSublayer(gradient, at: 0)
   }
}
