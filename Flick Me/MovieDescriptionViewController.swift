//
//  MovieDescriptionViewController.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 3/8/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation

import UIKit

class MovieDescriptionViewController: UIViewController {
    
    var summary: String?
    var posterURL: String?

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovieInfo()
    }
    
    func setupMovieInfo(){
        guard let posterURL = posterURL else {
            self.movieDescriptionLabel.text = summary
            return
        }
        let basePath = "https://image.tmdb.org/t/p/w200/"
        let url = basePath + posterURL
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                let loadedImage = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.moviePoster.image = loadedImage
                    self.movieDescriptionLabel.text = self.summary
                }
            }
        }
        task.resume()
        
        
    }
    


    
}






