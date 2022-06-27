//
//  CustomCell.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation
import UIKit

class CustomCell: UICollectionViewCell{
    
    
    
    private let stackv: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
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
             imageView.clipsToBounds = true
             imageView.contentMode = .scaleAspectFill
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
    
    var movieReleaseDate: UILabel = {
            let label = UILabel()
        label.font = label.font.withSize(15)
            label.textAlignment = .left
        label.textColor = UIColor(red: 56 / 255, green: 155 / 255, blue: 90 / 255, alpha: 1.0)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    var movieOverview: UILabel = {
            let label = UILabel()
        label.font = label.font.withSize(15)
            label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 4
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    var movieRate: UILabel = {
            let label = UILabel()
        label.font = label.font.withSize(15)
            label.textAlignment = .right
        label.textColor = UIColor(red: 56 / 255, green: 155 / 255, blue: 90 / 255, alpha: 1.0)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    var btnFavorites: UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.titleLabel?.textColor = .yellow
        btn.titleLabel?.textAlignment = .right
        let imageView = UIImage(systemName: "heart")
        btn.setImage(imageView, for: .normal)
        btn.backgroundColor = .gray
        btn.addTarget(self, action: #selector(favoritesAdd), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
        
    @objc func favoritesAdd(){
        let imageView = UIImage(systemName: "heart.fill")
        btnFavorites.setImage(imageView, for: .normal)
    }
    
        override init(frame: CGRect) {
            super.init(frame: .zero)
            
            addSubview(stackv)
            stackv.addArrangedSubview(movieImageView)
            stackv.addArrangedSubview(movieNameLabel)
            stackv.addSubview(stackh)
            stackh.addArrangedSubview(movieReleaseDate)
            stackh.addArrangedSubview(movieRate)
            stackv.addSubview(movieOverview)
            stackv.addSubview(btnFavorites)
            
            
            NSLayoutConstraint.activate([
                stackv.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackv.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 30),
                stackv.heightAnchor.constraint(equalToConstant: 460),
                stackv.widthAnchor.constraint(equalToConstant: 190),
                
                movieImageView.heightAnchor.constraint(equalToConstant: 240),
                movieImageView.bottomAnchor.constraint(equalTo: stackv.bottomAnchor, constant: -190),
                
                movieNameLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -115),
                movieNameLabel.leadingAnchor.constraint(equalTo: stackv.leadingAnchor, constant: 5),
                movieNameLabel.heightAnchor.constraint(equalToConstant: 50),
                
                stackh.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: -120),
                stackh.leadingAnchor.constraint(equalTo: stackv.leadingAnchor, constant: 0),
                stackh.trailingAnchor.constraint(equalTo: stackv.trailingAnchor, constant: 0),
                stackh.heightAnchor.constraint(equalToConstant: 10),
                
                movieOverview.topAnchor.constraint(equalTo: stackh.bottomAnchor, constant: 10),
                movieOverview.leadingAnchor.constraint(equalTo: stackv.leadingAnchor, constant: 10),
                movieOverview.trailingAnchor.constraint(equalTo: stackv.trailingAnchor, constant: -10),
                
                btnFavorites.topAnchor.constraint(equalTo: movieOverview.bottomAnchor, constant: 5),
                btnFavorites.leadingAnchor.constraint(equalTo: stackv.leadingAnchor, constant: 0),
                btnFavorites.trailingAnchor.constraint(equalTo: stackv.trailingAnchor, constant: 0),
                
                
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
       
    
}
