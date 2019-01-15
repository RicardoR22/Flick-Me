//
//  MovieListViewController.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 1/10/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    var results:[MovieInfo] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie cell", for: indexPath) as! MovieListTableViewCell
        
        let entry = results[indexPath.row]
        cell.labelMovieTitle.text = entry.title

        
        let basePath = "https://image.tmdb.org/t/p/w200/"
        let url = basePath + entry.poster
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                let loadedImage = UIImage(data: data!)
                DispatchQueue.main.async { 
                    cell.imageMovieThumbnail.image = loadedImage
                }
            
            }
        }
        task.resume()
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
}




