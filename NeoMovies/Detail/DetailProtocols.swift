//
//  DetailProtocols.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation

/// Detail Module View Protocol
protocol DetailViewDelegate: AnyObject {
    func showAlertDetail()
    func showDetail(data: Detail)
    
}

//MARK: Interactor -
/// Detail Module Interactor ProtoAnyObject
protocol DetailInteractorProtocol:AnyObject {
    func fetch(id: Int)
}

//MARK: Presenter -
/// Detail Module Presenter ProtoAnyObject
protocol DetailPresenterProtocol:AnyObject {
    func fetch(id: Int)
    func showFetch(data: Detail)
}

//MARK: Router (hay quienes dicen: Wireframe) -
/// Detail Module Router ProtoAnyObject
protocol DetailRouterProtocol:AnyObject {
   func backtoHome()
}
