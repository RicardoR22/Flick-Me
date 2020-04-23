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
    
	var descriptionView: MovieDescriptionView!
    var summary: String?
    var posterURL: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
		setup()
        setupMovieInfo()
    }
	
	func setup() {
		setupView()
		
	}
	
	
	func setupView() {
		let mainView = MovieDescriptionView(frame: self.view.frame)
		self.descriptionView = mainView
		self.view.addSubview(mainView)
		
	}
    
    func setupMovieInfo(){
        guard let posterURL = posterURL else {
			descriptionView.descriptionLabel.text = summary
            return
        }
        let basePath = "https://image.tmdb.org/t/p/w200/"
        let url = basePath + posterURL
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                let loadedImage = UIImage(data: data!)
                DispatchQueue.main.async {
					self.descriptionView.posterImage.image = loadedImage
					self.descriptionView.descriptionLabel.text = self.summary
                }
            }
        }
        task.resume()
        
        
    }
    


    
}






