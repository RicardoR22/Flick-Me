//
//  MovieListTableViewCell.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 1/10/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class MovieListTableViewCell: UITableViewCell {
	
	let movieTitleLabel: UILabel = {
		let textLabel = UILabel()
		textLabel.font = UIFont.boldSystemFont(ofSize: 16)
		textLabel.backgroundColor = .clear
		textLabel.textAlignment = .left
		textLabel.numberOfLines = 0
		
		return textLabel
	}()
	
	let moviePoster: UIImageView = {
		let imageView = UIImageView()
		
		
		return imageView
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		addSubview(moviePoster)
		addSubview(movieTitleLabel)
		
		self.layer.cornerRadius = 15.0
		
		moviePoster.translatesAutoresizingMaskIntoConstraints = false
		moviePoster.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
		moviePoster.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
		moviePoster.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
		moviePoster.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.18).isActive = true
		
		movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
		movieTitleLabel.leftAnchor.constraint(equalTo: moviePoster.rightAnchor, constant: 10).isActive = true
		movieTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
		
		movieTitleLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
		
	}


	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}


