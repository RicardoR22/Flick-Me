//
//  ViewController.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 1/9/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
	var filterView: FilterView!
	var selectedGenre: String = ""
	var genreId: Int = 0
	
	
	var genres = ["Action": 28 , "Comedy": 35, "Romance": 10749, "Horror": 27, "Animated": 16, "Drama": 18, "Mystery": 9648]
	var searchResults : [MovieInfo] = []
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		setup()
	}
	
	func setup() {
		setupView()
		self.title = "Filter"
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backTapped))
		filterView.genreTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		addButtonTarget()
	}
	
	
	func setupView() {
		let mainView = FilterView(frame: self.view.frame)
		self.filterView = mainView
		filterView.genreTableView.isHidden = true
		filterView.genreTableView.delegate = self
		filterView.genreTableView.dataSource = self
		self.view.addSubview(mainView)
		
	}
	
	func addButtonTarget() {
		filterView.genreBtn.addTarget(self, action: #selector(genreBtnTapped), for: .touchUpInside)
		filterView.flickMeBtn.addTarget(self, action: #selector(flickMeBtnTapped), for: .touchUpInside)
	}
	
	@objc func backTapped() {
		navigationController?.popViewController(animated: true)
	}
	
	@objc func genreBtnTapped() {
		print("genre button tapped")
		if filterView.genreTableView.isHidden {
			toggleTable(toggle: true)
		}else{
			toggleTable(toggle: false)
		}
	}
	
	@objc func flickMeBtnTapped() {
		print("flick me button tapped")
		
		MovieInfo.getMovieList(genre: genreId) { (results:[MovieInfo]) in
			self.searchResults = results
			
			DispatchQueue.main.async {
				print(self.searchResults)
				let movieListVC = MovieListViewController()
				movieListVC.results = self.searchResults
				self.navigationController?.pushViewController(movieListVC, animated: true)
				movieListVC.navigationItem.title = self.selectedGenre
			}
			
		}
	}
	
	
	
	func toggleTable(toggle: Bool) {
		if toggle {
			UIView.animate(withDuration: 0.3) {
				self.filterView.genreTableView.isHidden = false
				
			}
		} else {
			UIView.animate(withDuration: 0.3) {
				self.filterView.genreTableView.isHidden = true
				
			}
		}
	}
		
	
}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return genres.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = filterView.genreTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = Array(genres)[indexPath.row].key
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		filterView.genreBtn.setTitle("\(Array(genres)[indexPath.row].key)", for: .normal)
		genreId = Array(genres)[indexPath.row].value
		selectedGenre = Array(genres)[indexPath.row].key
		print(selectedGenre)
		searchResults.removeAll()
		MovieInfo.getMovieList(genre: genreId) { (results:[MovieInfo]) in
			for result in results {
				self.searchResults.append(result)
			}
		}
		
		toggleTable(toggle: false)
	}
	
}
