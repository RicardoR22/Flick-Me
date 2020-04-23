//
//  MovieListView.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 4/22/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import UIKit


class MovieListView: UIView {
	
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
	}

	func setupSubViews() {
		addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
	}
	
	let tableView: UITableView = {
		let tableView = UITableView()
		
		return tableView
	}()
	
}
