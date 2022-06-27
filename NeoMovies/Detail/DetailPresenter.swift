//
//  DetailPresenter.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation
import UIKit

class DetailPresenter {
    weak var _view: DetailViewDelegate?
    var interactor: DetailInteractorProtocol?
    var router: DetailRouterProtocol?
}


extension DetailPresenter: DetailPresenterProtocol{
    func fetch(id: Int) {
        interactor?.fetch(id: id)
    }
    
    func showFetch(data: Detail) {
        _view?.showDetail(data: data)
    }
    
   
 
    
}
