//
//  LoginProtocols.swift
//  NeoMovies
//
//  Created by ALFONSO on 17/06/22.
//

import Foundation

/// Login Module View Protocol
protocol LoginViewDelegate: AnyObject {
    func nextScreen()
    func showLegend()
    func logueo(u: String, p: String)
    func showError()
}

//MARK: Interactor -
/// Login Module Interactor ProtoAnyObject
protocol LoginInteractorProtocol:AnyObject {
    func nextScreen()
    func logueo(u: String, p: String)
}

//MARK: Presenter -
/// Login Module Presenter ProtoAnyObject
protocol LoginPresenterProtocol:AnyObject {
    func nextScreen()
    func logueo(u: String, p: String)
    func showError()
}

//MARK: Router (hay quienes dicen: Wireframe) -
/// Login Module Router ProtoAnyObject
protocol LoginRouterProtocol:AnyObject {
    func nextScreen()
}
