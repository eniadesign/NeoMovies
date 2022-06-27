//
//  CustomCell.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation
import UIKit

class CustomCellProd: UICollectionViewCell{
    
    
    
    private let stackv: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 10
        stackView.backgroundColor = UIColor(red: 20 / 255, green: 38 / 255, blue: 42 / 255, alpha: 1.0)
            return stackView
        }()
    
    private let stackh: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
         let movieImageView: UIImageView = {
            let imageView = UIImageView()
             imageView.layer.cornerRadius = 10
             imageView.clipsToBounds = false
             imageView.contentMode = .topLeft
             imageView.backgroundColor = .white
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
    var movieNameLabel: UILabel = {
            let label = UILabel()
            label.font = label.font.withSize(15)
            label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
            label.textColor = UIColor(red: 56 / 255, green: 155 / 255, blue: 90 / 255, alpha: 1.0)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
   
        
   
        override init(frame: CGRect) {
            super.init(frame: .zero)
            
            addSubview(stackv)
            stackv.addArrangedSubview(movieImageView)
//            stackv.addArrangedSubview(movieNameLabel)
            
            movieImageView.sizeToFit()
           
            
            
            NSLayoutConstraint.activate([
                stackv.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackv.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 30),
                stackv.heightAnchor.constraint(equalToConstant: 460),
                stackv.widthAnchor.constraint(equalToConstant: 790),
                
                movieImageView.heightAnchor.constraint(equalToConstant: 80),
                movieImageView.widthAnchor.constraint(equalToConstant: 180),
                movieImageView.topAnchor.constraint(equalTo: stackv.topAnchor, constant: 0),
                movieImageView.bottomAnchor.constraint(equalTo: stackv.bottomAnchor, constant: -10),
                
//                movieNameLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 15),
//                movieNameLabel.leadingAnchor.constraint(equalTo: stackv.leadingAnchor, constant: 25),
//                movieNameLabel.heightAnchor.constraint(equalToConstant: 20),
                
              
                
              
                
                
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
       
    
}
