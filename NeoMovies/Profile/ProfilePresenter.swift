//
//  ProfilePresenter.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation
import UIKit

class ProfilePresenter {
    weak var _view: ProfileViewDelegate?
    var interactor: ProfileInteractorProtocol?
    var router: ProfileRouterProtocol?
    var delegate: ProfileViewDelegate?
}


extension ProfilePresenter: ProfilePresenterProtocol{
   
 
    
}
