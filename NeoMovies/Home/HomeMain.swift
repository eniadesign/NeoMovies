//
//  HomeMain.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation
import UIKit
class HomeMain {
    public static func createModule(navigation: UINavigationController)->UIViewController{
     
        let ViewController: HomeView? = HomeView()
        
        if let view = ViewController {
            
            let presenter = HomePresenter()
            let interactor = HomeInteractor()
            let router = HomeRouter()
            
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
