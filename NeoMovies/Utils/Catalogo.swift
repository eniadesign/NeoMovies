//
//  Catalogo.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation

struct Catalogo: Codable {
    var results : [Results]
    
    enum codingKeys: String, CodingKey{
        case results = "results"
    }
}

struct Results: Codable{
    let id: Int
    let poster_path : String?
    let vote_average : Double
    let overview : String
    let release_date: String?
    let title: String?
    let name: String?
    let first_air_date: String?
}

struct Detail: Codable{
    let title: String
    let overview: String
    let poster_path: String?
    let homepage: String?
    let vote_average : Double
    let release_date: String?
    let production_companies: [production]
}

struct production: Codable{
    let id: Int
    let logo_path: String?
    let name: String
    let origin_country: String

}


struct CatalogoInit: Codable {
    var results : [ResultsInit]
    
    enum codingKeys: String, CodingKey{
        case results = "results"
    }
}

struct ResultsInit: Codable{
    let id: Int
    let poster_path : String
    let vote_average : Double
    let overview : String
    let release_date: String
    let title: String
}

struct Token: Codable{
    let token: String
}
