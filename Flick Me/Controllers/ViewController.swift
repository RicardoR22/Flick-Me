//
//  ViewController.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 3/8/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController {
	var mainView: MainView!
	var results:[MovieInfo] = []
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		setup()
	}
	
	func setup() {
		setupView()
		self.title = "Flick Me"
		addButtonTarget()
	}
	
	
	
	func setupView() {
		let mainView = MainView(frame: self.view.frame)
		self.mainView = mainView
		self.view.addSubview(mainView)
		
	}
	
	func addButtonTarget() {
		mainView.topMoviesBtn.addTarget(self, action: #selector(topMoviesTapped), for: .touchUpInside)
		mainView.randomMovieBtn.addTarget(self, action: #selector(randomMovieTapped), for: .touchUpInside)
	}
	
	@objc func topMoviesTapped() {
		print("Top Movies Tapped")
		let filterVC = FilterViewController()
		navigationController?.pushViewController(filterVC, animated: true)
	}
	
	@objc func randomMovieTapped() {
		let statusIndicator = StatusIndicatorViewController()
		DispatchQueue.main.async {
			
			statusIndicator.modalPresentationStyle = .overCurrentContext
			statusIndicator.message = "Finding Random Movie"
			self.present(statusIndicator, animated: true)
		}
		let randomPageNumber = Int.random(in: 0 ... 100)
		MovieInfo.getRandomMovie(page: randomPageNumber) { (movieList: [MovieInfo]) in
			
			
			DispatchQueue.main.async {
				
				let randomMovie = movieList.randomElement()!
				let descriptionVC = MovieDescriptionViewController()
				descriptionVC.summary = randomMovie.summary
				descriptionVC.posterURL = randomMovie.poster
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					statusIndicator.dismissAlert()
				}
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					self.navigationController?.pushViewController(descriptionVC, animated: true)
				}
				descriptionVC.navigationItem.title = randomMovie.title
				
			}
			
		}
	}
	

}
