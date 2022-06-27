//
//  database.swift
//  NeoMovies
//
//  Created by ALFONSO on 23/06/22.
//

import Foundation
import SQLite3

class databaseConn{
    
    var db: OpaquePointer?
    
    func setupDB(){
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                  .appendingPathComponent("favorites.sqlite")
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
                    print("error opening database")
                }
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS favorites (id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, imagen TEXT)", nil, nil, nil) != SQLITE_OK {
                   let errmsg = String(cString: sqlite3_errmsg(db)!)
                   print("error creating table: \(errmsg)")
               }
    }
    
    
    func addFavorite(data: [String]) {
        let titulo = data[0]
        let imagen = data[1]
        
               var stmt: OpaquePointer?
        
               let queryString = "INSERT INTO favorites (titulo, imagen) VALUES (?,?)"
        
               if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
                   let errmsg = String(cString: sqlite3_errmsg(db)!)
                   print("error preparing insert: \(errmsg)")
                   return
               }
        
               if sqlite3_bind_text(stmt, 1, titulo, -1, nil) != SQLITE_OK{
                   let errmsg = String(cString: sqlite3_errmsg(db)!)
                   print("failure binding name: \(errmsg)")
                   return
               }
        
                if sqlite3_bind_text(stmt, 2, imagen, -1, nil) != SQLITE_OK{
                   let errmsg = String(cString: sqlite3_errmsg(db)!)
                   print("failure binding name: \(errmsg)")
                   return
               }
        
               if sqlite3_step(stmt) != SQLITE_DONE {
                   let errmsg = String(cString: sqlite3_errmsg(db)!)
                   print("failure inserting hero: \(errmsg)")
                   return
               }
        
              
               print("saved successfully")
    }
    
}
