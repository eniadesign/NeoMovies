//
//  LoginMain.swift
//  NeoMovies
//
//  Created by ALFONSO on 17/06/22.
//

import Foundation
import UIKit
class LoginMain {
    public static func createModule(navigation: UINavigationController)->UIViewController{
     
        let ViewController: LoginView? = LoginView()
        
        if let view = ViewController {
            
            let presenter = LoginPresenter()
            let interactor = LoginInteractor()
            let router = LoginRouter()
            
            view.presenter = presenter
            presenter._view = view
            presenter.interactor = interactor
            presenter.router = router
            
            interactor.presenter = presenter
            router.navigation = navigation
            
            
            return view
        }
        
        return UIViewController()
    }
}
