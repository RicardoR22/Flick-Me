//
//  FilterView.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 4/22/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class FilterView: UIView {
	
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
		addSubview(genreLabel)
		addSubview(genreBtn)
		addSubview(genreTableView)
		addSubview(flickMeBtn)
	}
	
	let genreLabel: UILabel = {
		let label = UILabel()
		label.text = "Genre"
		label.font = .boldSystemFont(ofSize: 25)
		
		return label
	}()
	
	let genreBtn: UIButton = {
		let btn = UIButton()
		btn.backgroundColor = UIColor(named: "Secondary")
		btn.setTitle("Select Genre", for: .normal)
		btn.layer.cornerRadius = 5.0
		
		return btn
	}()
	
	let genreTableView: UITableView = {
		let tableView = UITableView()
		
		return tableView
	}()

	let flickMeBtn: UIButton = {
		let btn = UIButton()
		btn.backgroundColor = UIColor(named: "Primary")
		btn.setTitle("Flick Me!", for: .normal)
		btn.layer.cornerRadius = 5.0
		
		return btn
	}()

}
