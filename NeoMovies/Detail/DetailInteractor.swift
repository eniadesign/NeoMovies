//
//  DetailInteractor.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation

class DetailInteractor {
    var presenter: DetailPresenterProtocol?
}

extension DetailInteractor: DetailInteractorProtocol {
   
    func fetch(id: Int) {
        if let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=32bbaec60f9bd41c0e6209870feab6a7&language=en-US&page=1") {
           URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
        let jsonDecoder = JSONDecoder()
        do {
            let parsedJSON = try jsonDecoder.decode(Detail.self, from: data)
            print(parsedJSON)
            
            self.presenter?.showFetch(data: parsedJSON)
                } catch {
        print(error)
                }
               }
           }.resume()
        }
    }
    
}
