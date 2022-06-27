//
//  HomeProtocols.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation

/// Home Module View Protocol
protocol HomeViewDelegate: AnyObject {
    func showAlertProfile()
    func getShows(data: Catalogo)
    func getShowsInit(data: CatalogoInit)
    func addFavorite(data: [String])
    func getData(type: String)
    func loading()
    func gotoDetail(id: Int)
}

//MARK: Interactor -
/// Home Module Interactor ProtoAnyObject
protocol HomeInteractorProtocol:AnyObject {
    func fetch(type: String)
    func fetchinit()
}

//MARK: Presenter -
/// Home Module Presenter ProtoAnyObject
protocol HomePresenterProtocol:AnyObject {
    func profile()
    func fetch(type: String)
    func getShows(data: Catalogo)
    func getShowsInit(data: CatalogoInit)
    func gotoDetail(id: Int)
    func fetchinit()
    func logout()
}

//MARK: Router (hay quienes dicen: Wireframe) -
/// Home Module Router ProtoAnyObject
protocol HomeRouterProtocol:AnyObject {
    func profile()
    func gotoDetail(id: Int)
    func logout()
}
