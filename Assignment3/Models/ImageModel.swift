//
//  ImageModel.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/15/23.
//

import Foundation

struct ImageResults : Codable {
    let latest_photos : [ImageModel]
}

struct ImageModel : Codable, Identifiable {
    let id : Int
    let img_src : String
    
}

