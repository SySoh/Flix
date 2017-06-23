//
//  DetailViewController.swift
//  Flix
//
//  Created by Shao Yie Soh on 6/22/17.
//  Copyright © 2017 Shao Yie Soh. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {

    @IBOutlet weak var backDrop: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteAveLabel: UILabel!
    @IBOutlet weak var overviewLabel: UITextView!
    
    var movie: [String: Any]? = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationItem.title = "Detail"
        
        if let movie = movie{
        titleLabel.text = movie["title"] as? String
        releaseDateLabel.text = movie["release_date"] as? String
        voteAveLabel.text = "\(movie["vote_average"]!)" + "/10"
        overviewLabel.text = movie["overview"] as? String
        let posterString = (movie["poster_path"] as! String)
            let posterpath = URL(string: "https://image.tmdb.org/t/p/w500" + posterString)
            posterImage.af_setImage(withURL: posterpath!)
        let backdropString = (movie["backdrop_path"]) as? String
            let backdropPath = URL(string: "https://image.tmdb.org/t/p/w500" + backdropString!)
            backDrop.af_setImage(withURL: backdropPath!)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
 

}
