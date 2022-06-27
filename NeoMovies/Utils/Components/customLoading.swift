//
//  customLoading.swift
//  NeoMovies
//
//  Created by ALFONSO on 21/06/22.
//

import Foundation
import UIKit

class customLoading: UIAlertController{
    
    func loading(){
        let alert = UIAlertController(title: nil, message: "Loading", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            alert.dismiss(animated: false, completion: nil)
            blurEffectView.removeFromSuperview()
        }
    }
}
