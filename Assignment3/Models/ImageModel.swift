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
    let sol : Int
    let camera : CameraModel
    let img_src : String
    let earth_date : String
   //var isFavorited : Bool = false
    
}

struct CameraModel : Codable, Identifiable {
    let id : Int
    let rover_id : Int
    let full_name : String
} 
