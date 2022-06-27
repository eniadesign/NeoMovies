//
//  DetailViewUI.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation
import UIKit

class DetailViewUI: UIView {
    
    var navigation: UINavigationController?
    weak var delegate: DetailViewDelegate?
    var data: Detail?
    
    
    lazy var containerMain: UIView = {
        let vista = UIView()
        vista.backgroundColor = UIColor(red: 11 / 255, green: 19 / 255, blue: 27 / 255, alpha: 1.0)
        vista.translatesAutoresizingMaskIntoConstraints = false
        return vista
    }()
    
    lazy var overlay: UIView = {
        let vista = UIView()
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
        label.text = ""
        label.font = label.font.withSize(20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var overview: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = label.font.withSize(14)
        label.textColor = .white
        label.numberOfLines = 0
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
    
    lazy var vote_average: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = label.font.withSize(14)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var release_date: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = label.font.withSize(14)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var homepage: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = label.font.withSize(14)
        label.textColor = .white
        label.numberOfLines = 0
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
    
    
    lazy var imageDetail: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Detail")
        image.contentMode = .scaleAspectFill
        image.alpha = 0.2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var imageProduction: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var productor: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = label.font.withSize(14)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        let coll = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        coll.backgroundColor = .clear
        coll.translatesAutoresizingMaskIntoConstraints = false
        return coll
    }()
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.type = .axial
        gradient.colors = [
            UIColor(red: 11 / 255, green: 19 / 255, blue: 27 / 255, alpha: 1.0),
            UIColor.purple.cgColor,
            UIColor.cyan.cgColor
        ]
        gradient.locations = [0, 0.25, 1]
        return gradient
    }()
    
    //MARK: - funciones de boton
    @objc func showAlert(){
        delegate?.showAlertDetail()
    }
    
    //MARK: - Init
    
    public convenience init(navigation: UINavigationController){
        self.init()
        setupUIElements()
        setupConstraints()
        collection.delegate = self
        collection.dataSource = self
        collection.register(CustomCellProd.self, forCellWithReuseIdentifier: "movies")
        
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
        containerMain.addSubview(imageDetail)
       
        containerMain.addSubview(title)
        containerMain.addSubview(overview)
        containerMain.addSubview(favorites)
        containerMain.addSubview(collection)
        containerMain.addSubview(overlay)
        overlay.layer.addSublayer(gradient)
        collection.delegate = self
        collection.dataSource = self
        collection.register(CustomCellProd.self, forCellWithReuseIdentifier: "movies")
        self.bringSubviewToFront(overlay)
        containerMain.addSubview(vote_average)
        containerMain.addSubview(release_date)
        containerMain.addSubview(homepage)
        
        
      
    }
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            containerMain.topAnchor.constraint(equalTo:self.topAnchor),
            containerMain.leadingAnchor.constraint(equalTo:self.leadingAnchor),
            containerMain.trailingAnchor.constraint(equalTo:self.trailingAnchor),
            containerMain.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
           
            
            imageDetail.topAnchor.constraint(equalTo: containerMain.topAnchor, constant: 0),
            imageDetail.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 0),
            imageDetail.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: 0),
            imageDetail.bottomAnchor.constraint(equalTo: containerMain.bottomAnchor, constant: 0),
            
           
            title.topAnchor.constraint(equalTo: overview.topAnchor, constant: -15),
            title.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 30),
            title.heightAnchor.constraint(equalToConstant: 40),
            
            release_date.topAnchor.constraint(equalTo: overview.bottomAnchor, constant: 15),
            release_date.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 30),
            release_date.heightAnchor.constraint(equalToConstant: 15),
            
            vote_average.topAnchor.constraint(equalTo: overview.bottomAnchor, constant: 15),
            vote_average.leadingAnchor.constraint(equalTo: release_date.leadingAnchor, constant: 130),
            vote_average.heightAnchor.constraint(equalToConstant: 15),
            
            overview.bottomAnchor.constraint(equalTo: collection.topAnchor, constant: -15),
            overview.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 30),
            overview.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: -30),
            overview.heightAnchor.constraint(equalToConstant: 200),
            
            homepage.bottomAnchor.constraint(equalTo: overview.topAnchor, constant: -10),
            homepage.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 30),
            homepage.heightAnchor.constraint(equalToConstant: 40),
            
            
            favorites.topAnchor.constraint(equalTo: imageDetail.bottomAnchor, constant: 50),
            favorites.leadingAnchor.constraint(equalTo: imageDetail.leadingAnchor, constant: 0),
            favorites.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: -10),
            
            //MARK: - CollectionView
            collection.bottomAnchor.constraint(equalTo: containerMain.bottomAnchor, constant: -50),
            collection.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 20),
            collection.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: -24),
            collection.heightAnchor.constraint(equalToConstant: 170),
           
            
        ])
    }

}

extension DetailViewUI: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data?.production_companies.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movies", for: indexPath) as! CustomCellProd
          
        let image = "https://image.tmdb.org/t/p/original/\(data?.production_companies.first?.logo_path ?? "")"
        if let imageUrl = URL(string: image) {
            URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        let im = UIImage(data: data)?.withRenderingMode(.alwaysTemplate)
                        cell.movieImageView.image = im?.resizedImage(Size: CGSize(width: 120, height: 80))
                       
                    }
                } else {
                  
                }
            }.resume()
        }

       

        
           return cell
    }
    
   
    
    
}
