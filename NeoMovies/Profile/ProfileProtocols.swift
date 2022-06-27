//
//  ProfileProtocols.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation

/// Profile Module View Protocol
protocol ProfileViewDelegate: AnyObject {
    func showAlertProfile()
}

//MARK: Interactor -
/// Profile Module Interactor ProtoAnyObject
protocol ProfileInteractorProtocol:AnyObject {
  
}

//MARK: Presenter -
/// Profile Module Presenter ProtoAnyObject
protocol ProfilePresenterProtocol:AnyObject {
    
}

//MARK: Router (hay quienes dicen: Wireframe) -
/// Profile Module Router ProtoAnyObject
protocol ProfileRouterProtocol:AnyObject {
   
}
