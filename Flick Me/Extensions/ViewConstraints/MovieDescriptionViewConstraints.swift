//
//  MovieDescriptionViewConstraints.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 4/23/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension MovieDescriptionView {
	
	func setViewConstraints() {
		// Poster Image Constraints
		posterImage.translatesAutoresizingMaskIntoConstraints = false
		posterImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
		posterImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
		posterImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.6).isActive = true
		posterImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
		
		// Label Constraints
		label.translatesAutoresizingMaskIntoConstraints = false
		label.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
		label.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 50).isActive = true
		label.heightAnchor.constraint(equalToConstant: 50).isActive = true
		label.widthAnchor.constraint(equalToConstant: 200).isActive = true
		
		// Description Label Constraints
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 25).isActive = true
		descriptionLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
		descriptionLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
		
	}
	
}
