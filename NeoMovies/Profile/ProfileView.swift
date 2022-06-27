//
//  ProfileView.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import UIKit
import SQLite3

class ProfileView: UIViewController {
    
    weak var delegate: ProfileViewDelegate?
    var presenter: ProfilePresenterProtocol?
    private var ui = ProfileViewUI()
    var favList = [database]()
    var db: OpaquePointer?
    
    override func loadView() {
        ui = ProfileViewUI()
        ui.delegate = self
        readValues()
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        delegate = self
        
    }
    
    func readValues(){
    
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                   .appendingPathComponent("favorites.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
                   print("error opening database")
               }
        
        favList.removeAll()
    
           let queryString = "SELECT * FROM favorites order by id DESC"
    
           var stmt:OpaquePointer?
    
           if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
               let errmsg = String(cString: sqlite3_errmsg(db)!)
               print("error preparing insert: \(errmsg)")
               return
           }
    
           while(sqlite3_step(stmt) == SQLITE_ROW){
               let id = sqlite3_column_int(stmt, 0)
               let titulo = String(cString: sqlite3_column_text(stmt, 1))
               let imagen = String(cString: sqlite3_column_text(stmt, 2))
    
               favList.append(database(id: Int(id), titulo: String(describing: titulo), imagen: String(describing: imagen) ))
               ui.listaFavoritos = favList
           }
    
       }
}


//MARK: - Externsiones
extension ProfileView: ProfileViewDelegate{
    
    func showAlertProfile() {
        let actionSheet = UIAlertController(title: "What do yo wnat to do?", message: nil, preferredStyle: .actionSheet)

                // Create your actions - take a look at different style attributes
                let reportAction = UIAlertAction(title: "View Profile", style: .default) { (action) in
                   
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


