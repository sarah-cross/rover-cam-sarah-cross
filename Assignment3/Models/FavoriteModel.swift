//
//  FavoriteModel.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/27/23.
//

import Foundation
import FirebaseFirestoreSwift

struct FavoriteModel : Codable, Identifiable {    
    @DocumentID var id : String?
    var img_src : String
    //var isFavorited : Bool
}



