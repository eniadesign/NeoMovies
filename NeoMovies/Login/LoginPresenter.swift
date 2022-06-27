//
//  LoginPresenter.swift
//  NeoMovies
//
//  Created by ALFONSO on 17/06/22.
//

import Foundation
import UIKit

class LoginPresenter {
    weak var _view: LoginViewDelegate?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    var delegate: LoginViewDelegate?
}


extension LoginPresenter: LoginPresenterProtocol{
   
    func nextScreen(){
        router?.nextScreen()
    }
    
    func logueo(u: String, p: String) {
        interactor?.logueo(u: u, p: p)
    }
    
    func showError() {
        _view?.showError()
    }
    
}
