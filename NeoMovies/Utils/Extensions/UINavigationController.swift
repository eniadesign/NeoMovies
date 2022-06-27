//
//  UINavigationController.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import UIKit


public extension UINavigationController {
 
    func popBack(_ count: Int) {
        guard count > 0 else {
            return assertionFailure("Count can not be a negative value.")
        }
        let index = viewControllers.count - count - 1
        guard index > 0 else {
            return assertionFailure("Not enough View Controllers on the navigation stack.")
        }
        popToViewController(viewControllers[index], animated: true)
    }
    
   
    func popBack<T: UIViewController>(toControllerType: T.Type) {
        var viewControllers: [UIViewController] = self.viewControllers
        viewControllers = viewControllers.reversed()
        for currentViewController in viewControllers {
            if currentViewController .isKind(of: toControllerType) {
                self.popToViewController(currentViewController, animated: true)
                break
            }
        }
    }
    
    var isModal: Bool {
        
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
    
    func initRootViewController(_ vc: UIViewController, duration: CFTimeInterval = 0.3) {
        self.addTransition( duration: duration)
        self.viewControllers.removeAll()
        self.pushViewController(vc, animated: false)
        self.popToRootViewController(animated: false)
    }
    
   
    private func addTransition( duration: CFTimeInterval = 0.3) {
        let transition = CATransition()
        transition.duration = duration
        self.view.layer.add(transition, forKey: nil)
    }
    
     override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }

     override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
