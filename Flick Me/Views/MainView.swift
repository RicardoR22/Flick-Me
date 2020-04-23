//
//  MainView.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 4/22/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class MainView: UIView {
	
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
		addSubview(logoImage)
		addSubview(topMoviesBtn)
		addSubview(randomMovieBtn)
	}
	
	let topMoviesBtn: UIButton = {
		let btn = UIButton()
		btn.backgroundColor = UIColor(named: "Primary")
		btn.setTitle("Top Movies", for: .normal)
		btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
		btn.titleLabel?.textAlignment = .center
		
		btn.layer.cornerRadius = 15.0
		
		return btn
	}()
	
	let randomMovieBtn: UIButton = {
		let btn = UIButton()
		btn.backgroundColor = UIColor(named: "Primary")
		btn.setTitle("Random Movie", for: .normal)
		btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
		btn.titleLabel?.textAlignment = .center
		
		btn.layer.cornerRadius = 15.0
		
		return btn
	}()
	
	let logoImage: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage.init(named: "Logo")
			
		return imageView
	}()

}
