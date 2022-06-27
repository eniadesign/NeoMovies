//
//  LoginViewUI.swift
//  NeoMovies
//
//  Created by ALFONSO on 17/06/22.
//

import Foundation
import UIKit

class LoginViewUI: UIView {
    
    var navigation: UINavigationController?
    weak var delegate: LoginViewDelegate?
    
    lazy var containerMain: UIView = {
        let vista = UIView()
        vista.backgroundColor = UIColor(red: 6 / 255, green: 18 / 255, blue: 28 / 255, alpha: 1.0)
        vista.translatesAutoresizingMaskIntoConstraints = false
        return vista
    }()
    
    lazy var imagenBack: UIImageView = {
       let imagen = UIImageView()
        var image = UIImage(named: "backLogin");
        imagen.image = image;
        imagen.isUserInteractionEnabled = false
        imagen.translatesAutoresizingMaskIntoConstraints = false
        return imagen
    }()
   
    lazy var inputEmail: UITextField = {
        let textfield = UITextField(frame: .zero)

        textfield.keyboardType = .asciiCapable
        textfield.layer.cornerRadius = 5
        textfield.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height+10))
        textfield.leftViewMode = .always
        textfield.textColor = .black
        textfield.placeholder = "Username"
        textfield.text = ""
        textfield.returnKeyType = .next
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var inputPass: UITextField = {
        let textfield = UITextField(frame: .zero)
        textfield.keyboardType = .asciiCapable
        textfield.layer.cornerRadius = 5
        textfield.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height+10))
        textfield.leftViewMode = .always
        textfield.textColor = .black
        textfield.placeholder = "Password"
        textfield.text = ""
        textfield.returnKeyType = .next
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var signinButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(red: 215 / 255, green: 214 / 255, blue: 208 / 255, alpha: 1.0)
        button.layer.cornerRadius = 0
        button.setTitleColor(.white, for: .normal)
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let stringAttribute = NSMutableAttributedString(string: "Login", attributes: attributes)
        button.setAttributedTitle(stringAttribute, for: .normal)
        
        button.addTarget(self, action: #selector(self.nextScreen), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var leyenda: UILabel = {
        let texto = UILabel()
        texto.text = "Invalid username and/or password: You did not provide a valid login."
        texto.font = texto.font.withSize(14)
        texto.numberOfLines = 1
        texto.adjustsFontSizeToFitWidth = true
        texto.textColor = UIColor(red: 156 / 255, green: 72 / 255, blue: 46 / 255, alpha: 1.0)
        texto.textAlignment = .center
        texto.translatesAutoresizingMaskIntoConstraints = false
        return texto
    }()
    
    //MARK: - funciones de boton
    @objc func nextScreen() {
        delegate?.logueo(u: inputEmail.text?.lowercased() ?? "", p: inputPass.text?.lowercased()  ?? "")    }
    
    
    public convenience init(navigation: UINavigationController){
        self.init()
        setupUIElements()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
        setupConstraints()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    fileprivate func setupUIElements() {
        self.addSubview(self.containerMain)
        containerMain.addSubview(imagenBack)
        containerMain.addSubview(inputEmail)
        containerMain.addSubview(inputPass)
        containerMain.addSubview(signinButton)
        containerMain.addSubview(leyenda)
    }
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            containerMain.topAnchor.constraint(equalTo:self.topAnchor),
            containerMain.leadingAnchor.constraint(equalTo:self.leadingAnchor),
            containerMain.trailingAnchor.constraint(equalTo:self.trailingAnchor),
            containerMain.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imagenBack.topAnchor.constraint(equalTo: containerMain.topAnchor, constant: 0),
            imagenBack.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 0),
            imagenBack.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: 0),
            imagenBack.heightAnchor.constraint(equalToConstant: 400),
            
            inputEmail.centerXAnchor.constraint(equalTo: containerMain.centerXAnchor, constant: 0),
            inputEmail.centerYAnchor.constraint(equalTo: containerMain.centerYAnchor, constant: -10),
            inputEmail.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 40),
            inputEmail.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: -40),
            inputEmail.heightAnchor.constraint(equalToConstant: 40),
            
            inputPass.centerXAnchor.constraint(equalTo: containerMain.centerXAnchor, constant: 0),
            inputPass.topAnchor.constraint(equalTo: containerMain.bottomAnchor, constant: 25),
            inputPass.centerYAnchor.constraint(equalTo: containerMain.centerYAnchor, constant: 45),
            inputPass.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 40),
            inputPass.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: -40),
            inputPass.heightAnchor.constraint(equalToConstant: 40),
            
            signinButton.centerXAnchor.constraint(equalTo: containerMain.centerXAnchor, constant: 0),
            signinButton.centerYAnchor.constraint(equalTo: containerMain.centerYAnchor, constant: 100),
            signinButton.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 40),
            signinButton.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: -40),
            signinButton.heightAnchor.constraint(equalToConstant: 45),
            
            leyenda.centerXAnchor.constraint(equalTo: containerMain.centerXAnchor, constant: 0),
            leyenda.topAnchor.constraint(equalTo: signinButton.bottomAnchor, constant: 10),
            leyenda.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 20),
            leyenda.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: -20),
            
   
        ])
    }

}
