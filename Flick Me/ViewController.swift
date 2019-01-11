//
//  ViewController.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 1/9/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedGenre: String = ""
    var genreId: Int = 0
    
    
    @IBOutlet weak var genreButton: UIButton!
    @IBOutlet weak var genreTableView: UITableView!
    @IBOutlet weak var yearLabel: UILabel!
    
    
    
    var genres = ["Action": 28 , "Comedy": 35, "Romance": 10749, "Horror": 27, "Animated": 16, "Drama": 18, "Mystery": 9648]
    var searchResults : [MovieInfo] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let genreTableView = genreTableView {
            genreTableView.isHidden = true
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func genreButtonClicked(_ sender: Any) {
        if genreTableView.isHidden {
            toggleTable(toggle: true)
        }else{
            toggleTable(toggle: false)
        }
    }

    
    
    func toggleTable(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.2) {
                self.genreTableView.isHidden = false
                
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.genreTableView.isHidden = true
                
            }
        }
    }
    
    @IBAction func yearValueChanged(_ sender: UISlider) {
        yearLabel.text = String(Int(sender.value))
    }
    
    
    @IBAction func submitClicked(_ sender: Any) {
        
        MovieInfo.getMovieList(genre: genreId) { (results:[MovieInfo]) in
            for result in results {
                self.searchResults.append(result)
                print(self.searchResults)
            }
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let movieListViewController = segue.destination as? MovieListViewController else {
            
            //NOTE: error handling
            return print("storyboard not set up correctly, 'show entry details' segue needs to segue to a 'NewAnimeEntryViewController'")
        }
        movieListViewController.results = searchResults
        
    }
    
    
    @IBAction func unwind(segue:UIStoryboardSegue) { }
    
 
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = genreTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Array(genres)[indexPath.row].key
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        genreButton.setTitle("\(Array(genres)[indexPath.row].key)", for: .normal)
        genreId = Array(genres)[indexPath.row].value
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
