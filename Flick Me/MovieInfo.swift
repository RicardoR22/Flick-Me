//
//  MovieInfo.swift
//  Flick Me
//
//  Created by Ricardo Rodriguez on 1/10/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation

struct MovieInfo {
    let title: String
    let summary: String
    let poster: String
    let genre: [Int]
    let date: String
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    

    
    
   
    
    init(json:[String:Any]) throws {
        guard let title = json["title"] as? String else {throw SerializationError.missing("Title is missing")}
        guard let summary = json["overview"] as? String else {throw SerializationError.missing("Summary is missing")}
        guard let poster = json["poster_path"] as? String else {throw SerializationError.missing("Poster is missing")}
        guard let genre = json["genre_ids"] as? [Int] else {throw SerializationError.missing("Genre is missing")}
        guard let date = json["release_date"] as? String else {throw SerializationError.missing("Date is missing")}

        
        self.title = title
        self.summary = summary
        self.poster = poster
        self.genre = genre
        self.date = date
        
        
    }
    
    static let apiKey = "?api_key=44df7b58249b0e2cf21d3c8c9c38256e"
    static let basePath = "https://api.themoviedb.org/3/movie"
    
    static func getMovieList(genre: Int, completion: @escaping ([MovieInfo]) -> ()) {
        let url = basePath + "/top_rated" + apiKey
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            var movieList:[MovieInfo] = []
            
            if let data = data {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let popularMovieList = json["results"] as? [[String:Any]] {
//                            if let movieData = popularMovieList[""] as? [[String:Any]] {
                                for dataPoint in popularMovieList {
                                    if let movieObject = try? MovieInfo(json: dataPoint) {
                                        for genres in movieObject.genre {
                                            if genres == genre {
                                                movieList.append(movieObject)
                                            }
                                        }
                                    }
//                                }
                            }
                        }
                        
                    }
                }catch {
                    print(error.localizedDescription)
                }
                
                completion(movieList)
                
            }
            
            
        }
        task.resume()
        
    }
}

