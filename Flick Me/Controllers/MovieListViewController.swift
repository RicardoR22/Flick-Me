//
//  MovieListViewController.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 1/10/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
	var movieListView: MovieListView!
    var results:[MovieInfo] = []


    override func viewDidLoad() {
        super.viewDidLoad()
		setup()
    }
	
	func setup() {
		setupView()
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backTapped))
		movieListView.tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: "movie cell")

	}
	
	
	func setupView() {
		let mainView = MovieListView(frame: self.view.frame)
		self.movieListView = mainView
		movieListView.tableView.delegate = self
		movieListView.tableView.dataSource = self
		self.view.addSubview(mainView)
		
	}
	
	@objc func backTapped() {
		navigationController?.popViewController(animated: true)
	}
    
    func pullData(entry: MovieInfo, completion: @escaping (_ loadedImage: UIImage)-> Void){
        let basePath = "https://image.tmdb.org/t/p/w200/"
        let url = basePath + entry.poster
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                let loadedImage = UIImage(data: data!)
                DispatchQueue.main.async {
                    completion(loadedImage!)
                }
            }
        }
        task.resume()
    }
    
    
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie cell", for: indexPath) as! MovieListTableViewCell
        
        let entry = results[indexPath.row]
        cell.movieTitleLabel.text = entry.title

        pullData(entry: entry){ loadedImage in
            cell.moviePoster.image = loadedImage
        }
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = results[indexPath.row]
        
        let descriptionVC = MovieDescriptionViewController()
		descriptionVC.summary = movie.summary
		descriptionVC.posterURL = movie.poster
		self.navigationController?.pushViewController(descriptionVC, animated: true)
		descriptionVC.navigationItem.title = movie.title
    }

    
}




