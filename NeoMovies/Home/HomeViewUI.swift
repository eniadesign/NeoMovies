//
//  HomeViewUI.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation
import UIKit

class HomeViewUI: UIView {
    
    var navigation: UINavigationController?
    weak var delegate: HomeViewDelegate?
    var data: Catalogo?
    var dataInit: CatalogoInit?
    var buttonSet: String?
    var image: String?
    var use: Bool = false
   
    
    
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
        label.text = "TV Shows"
        label.textColor = .white
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
    
    lazy var btnPopular: UIButton = {
        let btn = UIButton()
        btn.setTitle("Popular", for: .normal)
        btn.layer.cornerRadius = 9
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(11)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.addTarget(self, action: #selector(self.markButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var btnTopRated: UIButton = {
        let btn = UIButton()
        btn.setTitle("Top Rated", for: .normal)
        btn.layer.cornerRadius = 9
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(11)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.addTarget(self, action: #selector(self.markButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var btnOnTv: UIButton = {
        let btn = UIButton()
        btn.setTitle("On Tv", for: .normal)
        btn.layer.cornerRadius = 9
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(11)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.addTarget(self, action: #selector(self.markButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var btnAiringTodaty: UIButton = {
        let btn = UIButton()
        btn.setTitle("Rating Today", for: .normal)
        btn.layer.cornerRadius = 9
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(11)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.addTarget(self, action: #selector(self.markButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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
    
    @objc func markButton(sender: UIButton){
        switch sender.titleLabel?.text {
        case "Popular":
            buttonSet = "movie"
            delegate?.getData(type: "movie/popular")
            delegate?.loading()
            break
        case "On Tv":
            delegate?.getData(type: "tv/popular")
            buttonSet = "tv"
            delegate?.loading()
        case "Top Rated":
            delegate?.getData(type: "movie/top_rated")
            buttonSet = "top_rated"
            delegate?.loading()
        case "Rating Today":
            delegate?.getData(type: "trending/all/day")
            buttonSet = "trending"
            delegate?.loading()
       break
        case .none:
            print("none")
        case .some(_):
            print("some")
        }
        nomarkButton()
        sender.backgroundColor = UIColor(red: 79 / 255, green: 78 / 255, blue: 73 / 255, alpha: 1.0)
    }
    
    func nomarkButton(){
        btnOnTv.backgroundColor = .clear
        btnTopRated.backgroundColor = .clear
        btnAiringTodaty.backgroundColor = .clear
        btnPopular.backgroundColor = .clear
    }
    
    //MARK: - Init
    public convenience init(navigation: UINavigationController){
        self.init()
        setupUIElements()
        setupConstraints()
        
        collection.delegate = self
        collection.dataSource = self
        collection.register(CustomCell.self, forCellWithReuseIdentifier: "movies")
        btnPopular.backgroundColor = UIColor(red: 79 / 255, green: 78 / 255, blue: 73 / 255, alpha: 1.0)
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
        containerMain.addSubview(topBar)
        topBar.addSubview(title)
        topBar.addSubview(iconSetting)
        
        containerMain.addSubview(btnPopular)
        containerMain.addSubview(btnTopRated)
        containerMain.addSubview(btnOnTv)
        containerMain.addSubview(btnAiringTodaty)
        containerMain.addSubview(collection)
      
    }
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            containerMain.topAnchor.constraint(equalTo:self.topAnchor),
            containerMain.leadingAnchor.constraint(equalTo:self.leadingAnchor),
            containerMain.trailingAnchor.constraint(equalTo:self.trailingAnchor),
            containerMain.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            topBar.topAnchor.constraint(equalTo: containerMain.topAnchor, constant: 0),
            topBar.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 0),
            topBar.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: 0),
            topBar.heightAnchor.constraint(equalToConstant: 120),
            
            title.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: -50),
            title.centerXAnchor.constraint(equalTo: topBar.centerXAnchor, constant: 0),
            title.heightAnchor.constraint(equalToConstant: 50),
            
            iconSetting.centerYAnchor.constraint(equalTo: title.centerYAnchor, constant: 0),
            iconSetting.trailingAnchor.constraint(equalTo: topBar.trailingAnchor, constant: -20),
            iconSetting.heightAnchor.constraint(equalToConstant: 20),
            
            
            //MARK: - Botones
            btnPopular.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: 20),
            btnPopular.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 10),
            btnPopular.widthAnchor.constraint(equalToConstant: 80),
            btnPopular.heightAnchor.constraint(equalToConstant: 30),
            
            btnTopRated.topAnchor.constraint(equalTo: btnPopular.topAnchor, constant: 0),
            btnTopRated.leadingAnchor.constraint(equalTo: btnPopular.trailingAnchor, constant: 0),
            btnTopRated.widthAnchor.constraint(equalToConstant: 80),
            btnTopRated.heightAnchor.constraint(equalToConstant: 30),
            
            btnOnTv.topAnchor.constraint(equalTo: btnTopRated.topAnchor, constant: 0),
            btnOnTv.leadingAnchor.constraint(equalTo: btnTopRated.trailingAnchor, constant: 0),
            btnOnTv.widthAnchor.constraint(equalToConstant: 80),
            btnOnTv.heightAnchor.constraint(equalToConstant: 30),
            
            btnAiringTodaty.topAnchor.constraint(equalTo: btnOnTv.topAnchor, constant: 0),
            btnAiringTodaty.leadingAnchor.constraint(equalTo: btnOnTv.trailingAnchor, constant: 0),
            //btnAiringTodaty.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: 0),
            btnAiringTodaty.widthAnchor.constraint(equalToConstant: 80),
            btnAiringTodaty.heightAnchor.constraint(equalToConstant: 30),
            
            //MARK: - CollectionView
            collection.topAnchor.constraint(equalTo: containerMain.topAnchor, constant: 185),
            collection.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 20),
            collection.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: -20),
            collection.bottomAnchor.constraint(equalTo: containerMain.bottomAnchor, constant: -20),
           
        ])
    }

}

extension HomeViewUI: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if use == true {
            return data?.results.count ?? 0
        }else{
            return dataInit?.results.count ?? 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movies", for: indexPath) as! CustomCell
          
        
        if use == true {
           
       
        switch buttonSet {
        case "tv":
            image = "https://image.tmdb.org/t/p/original/\(data?.results[indexPath.row].poster_path?.replacingOccurrences(of: "Optional(\"", with: "").replacingOccurrences(of: ")", with: "") ?? "")"
        case "movie":
             image = "https://image.tmdb.org/t/p/original/\(data?.results[indexPath.row].poster_path ?? "")"
        case "trending":
            image = "https://image.tmdb.org/t/p/original/\(data?.results[indexPath.row].poster_path ?? "")"
        case "top_rated":
            image = "https://image.tmdb.org/t/p/original/\(data?.results[indexPath.row].poster_path ?? "")"
        case .none: break
            
        case .some(_): break
        
        }
        
        
        if let imageUrl = URL(string: image ?? "") {
            URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.movieImageView.image = UIImage(data: data)?.resizedImage(Size: CGSize(width: 150, height: 250))?.withRenderingMode(.alwaysOriginal)                   }
                } else {
                  
                }
            }.resume()
        }

        
       
        cell.movieRate.text = "\(data?.results[indexPath.row].vote_average ?? 0.0)"
       
        cell.movieOverview.text =  data?.results[indexPath.row].overview
        
        switch buttonSet {
        case "movie":
            cell.movieNameLabel.text = data?.results[indexPath.row].title ?? ""
            cell.movieReleaseDate.text = data?.results[indexPath.row].release_date
        case "tv":
            cell.movieNameLabel.text = data?.results[indexPath.row].name ?? ""
            cell.movieReleaseDate.text = data?.results[indexPath.row].first_air_date
        case "trending":
            cell.movieNameLabel.text = data?.results[indexPath.row].title ?? ""
            cell.movieReleaseDate.text = data?.results[indexPath.row].release_date
        case "top_rated":
            cell.movieNameLabel.text = data?.results[indexPath.row].title ?? ""
            cell.movieReleaseDate.text = data?.results[indexPath.row].release_date
        default:
            break
        }
        
        }else{
            
            image = "https://image.tmdb.org/t/p/original/\(dataInit?.results[indexPath.row].poster_path ?? "")"
            
            if let imageUrl = URL(string: image ?? "") {
                URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { (data, response, error) in
                    if let data = data {
                        DispatchQueue.main.async {
                            cell.movieImageView.image = UIImage(data: data)?.resizedImage(Size: CGSize(width: 150, height: 250))?.withRenderingMode(.alwaysOriginal)                   }
                    } else {
                      
                    }
                }.resume()
            }

            cell.movieRate.text = "\(dataInit?.results[indexPath.row].vote_average ?? 0.0)"
            cell.movieOverview.text =  dataInit?.results[indexPath.row].overview
            cell.movieNameLabel.text = dataInit?.results[indexPath.row].title ?? ""
            cell.movieReleaseDate.text = dataInit?.results[indexPath.row].release_date
            
        }
        
           return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movies", for: indexPath) as! CustomCell
        let imageView = UIImage(systemName: "heart")
        cell.btnFavorites.setImage(imageView, for: .normal)
       
        //delegate?.addFavorite(data: ["\(data?.results[indexPath.row].title ?? "")", "\(data?.results[indexPath.row].poster_path ?? "")"])
        
        if use == true {
            
            delegate?.gotoDetail(id: data?.results[indexPath.row].id ?? 0)
        }else{
            delegate?.gotoDetail(id: dataInit?.results[indexPath.row].id ?? 0)
        }
        
    }
    
    
}

