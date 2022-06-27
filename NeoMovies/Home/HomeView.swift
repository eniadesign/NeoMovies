//
//  HomeView.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import UIKit
import SQLite3

class HomeView: UIViewController {
    
    weak var delegate: HomeViewDelegate?
    var presenter: HomePresenterProtocol?
    private var ui = HomeViewUI()
    var loadCustom = customLoading()
    var activeField: UITextField?
    var data: Catalogo?
    var dataInit: CatalogoInit?
    var dbconn = databaseConn()
   
    var db: OpaquePointer?
    
    override func loadView() {
        ui = HomeViewUI(navigation: self.navigationController!)
        ui.delegate = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        delegate = self
        dbconn.setupDB()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.fetchinit()
        loading()
    }
    
    func loadData(d: Catalogo){
        self.ui.data = d
        self.ui.use = true
        DispatchQueue.main.async {
            self.ui.collection.reloadData()
        }
    }
    
    func loadDataInit(d: CatalogoInit){
        self.ui.dataInit = d
        DispatchQueue.main.async {
            self.ui.collection.reloadData()
        }
    }
    
}


//MARK: - Externsiones
extension HomeView: HomeViewDelegate{
    func gotoDetail(id: Int) {
        presenter?.gotoDetail(id: id)
    }
    
    
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            alert.dismiss(animated: true, completion: nil)
            blurEffectView.removeFromSuperview()
        }
    }
    
    func getData(type: String) {
        presenter?.fetch(type: type)
    }
    
    func addFavorite(data: [String]) {
        dbconn.addFavorite(data: data)
    }
    
    
    func getShows(data: Catalogo) {
        self.data = data
        self.loadData(d: data)
    }
    
    func getShowsInit(data: CatalogoInit){
        self.dataInit = data
        self.loadDataInit(d: data)
    }
    
    
    
    
    func showAlertProfile() {
        let actionSheet = UIAlertController(title: "What do yo wnat to do?", message: nil, preferredStyle: .actionSheet)

                let reportAction = UIAlertAction(title: "View Profile", style: .default) { (action) in
                    self.presenter?.profile()
                }

                let blockAction = UIAlertAction(title: "Logout", style: .destructive) { (action) in
                    self.presenter?.logout()
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


