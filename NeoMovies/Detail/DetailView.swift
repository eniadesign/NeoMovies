//
//  DetailView.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import UIKit
import SQLite3

class DetailView: UIViewController {
    
    weak var delegate: DetailViewDelegate?
    var presenter: DetailPresenterProtocol?
    private var ui = DetailViewUI()
    var favList = [database]()
    var db: OpaquePointer?
    var id: Int? = 0
    
    override func loadView() {
        ui = DetailViewUI()
        ui.delegate = self
        presenter?.fetch(id: self.id ?? 0)
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        delegate = self
    }
    
   
}


//MARK: - Externsiones
extension DetailView: DetailViewDelegate{
    func showDetail(data: Detail) {
        ui.data = data
        DispatchQueue.main.sync {
            ui.title.text = data.title
            ui.vote_average.text = String(data.vote_average)
            ui.release_date.text = data.release_date
            ui.homepage.text = data.homepage
            ui.imageDetail.loadFrom(URLAddress: "https://image.tmdb.org/t/p/original/\(data.poster_path ?? "")")
            ui.overview.text = data.overview
            
        }
        
    }
    
    
    func showAlertDetail() {
        let actionSheet = UIAlertController(title: "What do yo wnat to do?", message: nil, preferredStyle: .actionSheet)

                let reportAction = UIAlertAction(title: "View Detail", style: .default) { (action) in                  
                }

                let blockAction = UIAlertAction(title: "Logout", style: .destructive) { (action) in
                }

                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                    self.dismiss(animated: true)
                }
                actionSheet.addAction(reportAction)
                actionSheet.addAction(blockAction)
                actionSheet.addAction(cancelAction)
                self.present(actionSheet, animated: true, completion: nil)
    }
    
   
    
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}


