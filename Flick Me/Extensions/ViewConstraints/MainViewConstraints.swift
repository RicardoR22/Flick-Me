//
//  MainViewConstraints.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 4/22/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit


extension MainView {
	
	func setViewConstraints() {
		
		// Logo Constraints
		logoImage.translatesAutoresizingMaskIntoConstraints = false
		logoImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
		logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
		logoImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
		logoImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
		
		// Top Movies Button Constraints
		topMoviesBtn.translatesAutoresizingMaskIntoConstraints = false
		topMoviesBtn.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50).isActive = true
		topMoviesBtn.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
		topMoviesBtn.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
		topMoviesBtn.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
		
		// Random Movie Button Constraints
		randomMovieBtn.translatesAutoresizingMaskIntoConstraints = false
		randomMovieBtn.topAnchor.constraint(equalTo: topMoviesBtn.bottomAnchor, constant: 50).isActive = true
		randomMovieBtn.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
		randomMovieBtn.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
		randomMovieBtn.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
		
	}
	
}
