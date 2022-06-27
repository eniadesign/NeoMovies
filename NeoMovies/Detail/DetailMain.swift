//
//  DetailMain.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation
import UIKit
class DetailMain {
    public static func createModule(navigation: UINavigationController, id: Int)->UIViewController{
     
        let ViewController: DetailView? = DetailView()
        
        if let view = ViewController {
            
            let presenter = DetailPresenter()
            let interactor = DetailInteractor()
            let router = DetailRouter()
            
            view.presenter = presenter
            presenter._view = view
            presenter.interactor = interactor
            presenter.router = router
            view.id = id
            
            interactor.presenter = presenter
            router.navigation = navigation
            
            
            return view
        }
        
        return UIViewController()
    }
}
