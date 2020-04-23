//
//  MovieDescriptionView.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 4/23/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class MovieDescriptionView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupView() {
		backgroundColor = UIColor.init(named: "Background")
		setupSubViews()
		setViewConstraints()
	}

	func setupSubViews() {
		addSubview(posterImage)
		addSubview(label)
		addSubview(descriptionLabel)
	}
	
	let posterImage: UIImageView = {
		let imageView = UIImageView()
	
		return imageView
	}()
	
	let label: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 25)
		label.textAlignment = .left
		label.text = "Description"
		
		return label
	}()
	
	let descriptionLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .left
		label.numberOfLines = 0
		
		return label
	}()
}
