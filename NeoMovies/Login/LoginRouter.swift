//
//  LoginRouter.swift
//  NeoMovies
//
//  Created by ALFONSO on 17/06/22.
//

import UIKit


class LoginRouter {
    var navigation: UINavigationController?
}

extension LoginRouter: LoginRouterProtocol{
    
    func nextScreen() {
                let vc = HomeMain.createModule(navigation: self.navigation!)
                navigation?.pushViewController(vc, animated: true)
    }
    
    
}


