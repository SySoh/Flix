//
//  SuperheroViewController.swift
//  Flix
//
//  Created by Shao Yie Soh on 6/23/17.
//  Copyright © 2017 Shao Yie Soh. All rights reserved.
//

import UIKit
import AlamofireImage

class SuperheroViewController: UIViewController, UICollectionViewDataSource {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    var refreshControl: UIRefreshControl!
    
    var movies: [[String: Any]] = []
    
    func networkRequest(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=5f89533e24a2ff0828389c5e1cb6f8e8")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                self.collectionView.reloadData()
                self.refreshControl.endRefreshing()
                //self.loadingIndicator.stopAnimating()
            }
        }
        task.resume()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        
        let movie = movies[indexPath.item]
        if let posterPathString = movie["poster_path"] as? String {
            let baseURL = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURL + posterPathString)!
            cell.posterView.af_setImage(withURL: posterURL)
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.white
        tabBarController?.tabBar.barTintColor = UIColor.white
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullToRefresh(_:)), for: .valueChanged)
        collectionView.insertSubview(refreshControl, at: 0)

        networkRequest()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func didPullToRefresh(_ refreshControl: UIRefreshControl){
        networkRequest()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as! DetailViewController
        let source = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: source){
            let movie = movies[indexPath.row]
            destVC.movie = movie
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
}
