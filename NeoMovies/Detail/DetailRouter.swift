//
//  DetailRouter.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import UIKit


class DetailRouter {
    var navigation: UINavigationController?
}

extension DetailRouter: DetailRouterProtocol{
    func backtoHome() {
        let vc = HomeMain.createModule(navigation: self.navigation!)
        navigation?.present(vc, animated: true)
    }
    
    
   
    
    
}


