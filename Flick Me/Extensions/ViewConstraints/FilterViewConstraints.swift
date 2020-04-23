//
//  FilterViewConstraints.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 4/22/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit


extension FilterView {
	func setViewConstraints() {
		
		// Genre Label Constraints
		genreLabel.translatesAutoresizingMaskIntoConstraints = false
		genreLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 75).isActive = true
		genreLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
		genreLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
		genreLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
		
		// Genre Button Constraints
		genreBtn.translatesAutoresizingMaskIntoConstraints = false
		genreBtn.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 20).isActive = true
		genreBtn.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
		genreBtn.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -25).isActive = true
		genreBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		// Genre Table View Constraints
		genreTableView.translatesAutoresizingMaskIntoConstraints = false
		genreTableView.topAnchor.constraint(equalTo: genreBtn.bottomAnchor).isActive = true
		genreTableView.leftAnchor.constraint(equalTo: genreBtn.leftAnchor).isActive = true
		genreTableView.rightAnchor.constraint(equalTo: genreBtn.rightAnchor).isActive = true
		genreTableView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
		
		// Flick Me Button Constraints
		flickMeBtn.translatesAutoresizingMaskIntoConstraints = false
		flickMeBtn.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
		flickMeBtn.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 100).isActive = true
		flickMeBtn.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -100).isActive = true
		flickMeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
	}
}
