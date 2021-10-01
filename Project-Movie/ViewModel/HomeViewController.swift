//
//  ViewController.swift
//  Project-Movie
//
//  Created by Evandro Rodrigo Minamoto on 27/09/21.
//

import UIKit

class ViewController: UIViewController {

    var movieNetwork = MovieNetwork()
    var checked = false
    
    
//    MARK:- Outlet
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var vote_countLabel: UILabel!
    
    @IBOutlet weak var popularityLabel: UILabel!
    
    
    
//    MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
              
        self.detailImageView.addBlackGradientLayerInBackground(frame: detailImageView.frame, colors: [.clear, .black])
           
        self.myTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.movieNetwork.getData()
        
        // Do any additional setup after loading the view.
    }
    
// MARK: - Action
    @IBAction func heartButton(_ sender: UIButton) {
        if checked {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            checked = false
        } else {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            checked = true
        }
    }
    
    
    
    
    
}

//MARK: - Extension Tableview
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MovieTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
        
        
        
        return cell ?? UITableViewCell()
    }
    

}
extension UIView{
   // For insert layer in Foreground
   func addBlackGradientLayerInForeground(frame: CGRect, colors:[UIColor]){
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.addSublayer(gradient)
   }
   // For insert layer in background
   func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.insertSublayer(gradient, at: 0)
   }
}
