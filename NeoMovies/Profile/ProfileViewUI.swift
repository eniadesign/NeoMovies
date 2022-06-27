//
//  ProfileViewUI.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation
import UIKit

class ProfileViewUI: UIView {
    
    var navigation: UINavigationController?
    weak var delegate: ProfileViewDelegate?
    var listaFavoritos: [database] = []
    
    lazy var containerMain: UIView = {
        let vista = UIView()
        vista.backgroundColor = UIColor(red: 11 / 255, green: 19 / 255, blue: 27 / 255, alpha: 1.0)
        vista.translatesAutoresizingMaskIntoConstraints = false
        return vista
    }()
    
    lazy var topBar: UIView = {
        let tp = UIView()
        tp.backgroundColor = UIColor(red: 43 / 255, green: 51 / 255, blue: 44 / 255, alpha: 1.0)
        tp.translatesAutoresizingMaskIntoConstraints = false
        return tp
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = label.font.withSize(20)
        label.textColor = UIColor(red: 43 / 255, green: 203 / 255, blue: 112 / 255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var email: UILabel = {
        let label = UILabel()
        label.text = "@luisgarciav"
        label.font = label.font.withSize(14)
        label.textColor = UIColor(red: 43 / 255, green: 203 / 255, blue: 112 / 255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var favorites: UILabel = {
        let label = UILabel()
        label.text = "Favorite Shows"
        label.font = label.font.withSize(20)
        label.textColor = UIColor(red: 43 / 255, green: 203 / 255, blue: 112 / 255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var iconSetting: UIButton = {
        let iv = UIButton()
        var imagen = UIImage()
        imagen = UIImage(systemName: "list.bullet", compatibleWith: .none)!
        iv.setImage(imagen, for: .normal)
        iv.tintColor = .white
        iv.addTarget(self, action: #selector(self.showAlert), for: .touchUpInside)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    lazy var imageProfile: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profile")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 170, height: 480)
        let coll = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        coll.backgroundColor = .clear
        coll.translatesAutoresizingMaskIntoConstraints = false
        return coll
    }()
    
    //MARK: - funciones de boton
    @objc func showAlert(){
        delegate?.showAlertProfile()
    }
    
    //MARK: - Init
    
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
        containerMain.addSubview(imageProfile)
        containerMain.addSubview(title)
        containerMain.addSubview(email)
        containerMain.addSubview(favorites)
        containerMain.addSubview(collection)
        
        collection.delegate = self
        collection.dataSource = self
        collection.register(CustomCell.self, forCellWithReuseIdentifier: "movies")
      
      
    }
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            containerMain.topAnchor.constraint(equalTo:self.topAnchor),
            containerMain.leadingAnchor.constraint(equalTo:self.leadingAnchor),
            containerMain.trailingAnchor.constraint(equalTo:self.trailingAnchor),
            containerMain.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            title.topAnchor.constraint(equalTo: containerMain.topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 30),
            title.heightAnchor.constraint(equalToConstant: 40),
            
            imageProfile.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            imageProfile.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 30),
            imageProfile.widthAnchor.constraint(equalToConstant: 110),
            imageProfile.heightAnchor.constraint(equalToConstant: 117),
            
            email.centerYAnchor.constraint(equalTo: imageProfile.centerYAnchor, constant: 0),
            email.leadingAnchor.constraint(equalTo: imageProfile.leadingAnchor, constant: 130),
            email.heightAnchor.constraint(equalToConstant: 40),
            
            favorites.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 50),
            favorites.leadingAnchor.constraint(equalTo: imageProfile.leadingAnchor, constant: 0),
            favorites.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: -10),
            
            //MARK: - CollectionView
            collection.topAnchor.constraint(equalTo: containerMain.topAnchor, constant: 285),
            collection.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 20),
            collection.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: -20),
            collection.bottomAnchor.constraint(equalTo: containerMain.bottomAnchor, constant: -20),
           
        ])
    }

}

extension ProfileViewUI: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listaFavoritos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movies", for: indexPath) as! CustomCell
          
        let image = "https://image.tmdb.org/t/p/original/\(listaFavoritos[indexPath.row].imagen ?? "")"
        if let imageUrl = URL(string: image) {
            URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.movieImageView.image = UIImage(data: data)                    }
                } else {
                  
                }
            }.resume()
        }

        
//        cell.movieReleaseDate.text = data?.results[indexPath.row].release_date
//        cell.movieRate.text = "\(data?.results[indexPath.row].vote_average ?? 0.0)"
        cell.movieNameLabel.text = listaFavoritos[indexPath.row].titulo
//        cell.movieOverview.text =  data?.results[indexPath.row].overview
        
           return cell
    }
    
   
    
    
}
