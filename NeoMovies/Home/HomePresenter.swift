//
//  HomePresenter.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation
import UIKit

class HomePresenter {
    weak var _view: HomeViewDelegate?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    var delegate: HomeViewDelegate?
}


extension HomePresenter: HomePresenterProtocol{
    
    func gotoDetail(id: Int) {
        router?.gotoDetail(id: id)
    }
    
    
    func fetch(type: String) {
        interactor?.fetch(type: type)
    }
    
    
    func profile() {
        router?.profile()
    }
    
    func getShows(data: Catalogo) {
        _view?.getShows(data: data)
    }
    
    func fetchinit(){
        interactor?.fetchinit()
    }
    
    func getShowsInit(data: CatalogoInit){
        _view?.getShowsInit(data: data)
    }
    
    func logout() {
        router?.logout()
    }
    
}
