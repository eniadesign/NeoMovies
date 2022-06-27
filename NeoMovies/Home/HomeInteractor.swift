//
//  HomeInteractor.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation

class HomeInteractor {
    var presenter: HomePresenterProtocol?
    var endP = Path()
}

extension HomeInteractor: HomeInteractorProtocol {
 
    func fetch(type: String){
        var endpoint: String!
        switch type {
        case "movie/popular":
            endpoint = endP.movie
        case "tv/popular":
            endpoint = endP.tv
        case "movie/top_rated":
            endpoint = endP.movieTopRated
        case "trending/all/day":
            endpoint = endP.movieTrending
        default:
            endpoint = endP.movie
        }
        if let url = URL(string: endpoint) {
          print("Catalogo:: \(url)")
            URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
        let jsonDecoder = JSONDecoder()
        do {
            let parsedJSON = try jsonDecoder.decode(Catalogo.self, from: data)
            print("Catalogo:: \(parsedJSON)")
            
            self.presenter?.getShows(data: parsedJSON)
                } catch {
        print(error)
                }
               }
           }.resume()
        }
    }
    
    
    func fetchinit() {
        if let url =  URL(string: endP.movie)   {
          print("Catalogo:: \(url)")
            URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
        let jsonDecoder = JSONDecoder()
        do {
            let parsedJSON = try jsonDecoder.decode(CatalogoInit.self, from: data)
            print("Catalogo:: \(parsedJSON)")
            
           self.presenter?.getShowsInit(data: parsedJSON)
                } catch {
        print(error)
                }
               }
           }.resume()
        }
    }
    
    
    
}
