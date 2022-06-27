//
//  HomeRouter.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import UIKit


class HomeRouter {
    var navigation: UINavigationController?
}

extension HomeRouter: HomeRouterProtocol{
    
    func gotoDetail(id: Int) {
        let vc = DetailMain.createModule(navigation: self.navigation!, id: id)
        navigation?.present(vc, animated: true)
    }
    
    
    func profile() {
        let vc = ProfileMain.createModule(navigation: self.navigation!)
        navigation?.present(vc, animated: true)
    }
    
    func logout() {
        let vc = LoginMain.createModule(navigation: self.navigation!)
        navigation?.pushViewController(vc, animated: true)
        
    }
    
    
}


