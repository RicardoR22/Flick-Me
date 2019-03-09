//
//  ViewController.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 3/8/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    var results:[MovieInfo] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "show random movie":
                if let movieDescriptionViewController = segue.destination as? MovieDescriptionViewController, let movie = sender as? MovieInfo {
                    movieDescriptionViewController.summary = movie.summary
                    movieDescriptionViewController.posterURL = movie.poster
                    movieDescriptionViewController.navigationItem.title = movie.title
                }
                
            default: break
            }
        }
        
        
    }
    
    @IBAction func unwind(segue:UIStoryboardSegue) { }
    
    
    @IBAction func showRandomMovie(_ sender: Any) {
        
        let randomPageNumber = Int.random(in: 0 ... 100)
        MovieInfo.getRandomMovie(page: randomPageNumber) { (movieList: [MovieInfo]) in
            
            DispatchQueue.main.async {
                var randomMovie = movieList.randomElement()!
                self.performSegue(withIdentifier: "show random movie", sender: randomMovie)
            }
            
        }
        
    }
    
}
