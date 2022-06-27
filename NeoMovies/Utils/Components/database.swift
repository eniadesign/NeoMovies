//
//  database.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import Foundation

class database {
   
    var id: Int
       var titulo: String?
       var imagen: String?
    
       init(id: Int, titulo: String?, imagen: String?){
           self.id = id
           self.titulo = titulo
           self.imagen = imagen
       }
    
}
