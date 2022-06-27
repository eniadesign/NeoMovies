//
//  ProfileMain.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation
import UIKit
class ProfileMain {
    public static func createModule(navigation: UINavigationController)->UIViewController{
     
        let ViewController: ProfileView? = ProfileView()
        
        if let view = ViewController {
            
            let presenter = ProfilePresenter()
            let interactor = ProfileInteractor()
            let router = ProfileRouter()
            
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
