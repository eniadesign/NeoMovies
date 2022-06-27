//
//  LoginView.swift
//  NeoMovies
//
//  Created by ALFONSO on 17/06/22.
//

import UIKit

class LoginView: UIViewController {
    
    weak var delegate: LoginViewDelegate?
    var presenter: LoginPresenterProtocol?
    private var ui = LoginViewUI()
    var activeField: UITextField?
    
    override func loadView() {
        ui = LoginViewUI(navigation: self.navigationController!)
        ui.delegate = self
        ui.leyenda.isHidden = true
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        ui.inputEmail.delegate = self
        ui.inputPass.delegate = self
        delegate = self
    }
}


//MARK: - Externsiones
extension LoginView: LoginViewDelegate{
    func nextScreen() {
        presenter?.nextScreen()
    }
    
    func showLegend() {
        
    }
    
    func logueo(u: String, p: String){
        presenter?.logueo(u: u, p: p)
    }
    
    func showError() {
        DispatchQueue.main.async {
            self.ui.leyenda.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { 
            self.ui.leyenda.isHidden = true
        }
        
    }
    
    
}

extension LoginView: UITextFieldDelegate{

    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -150, up: true)
    }
    
   
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -150, up: false)
    }
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
}
