//
//  RoverModel.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/15/23.
//

import Foundation

struct RoverResults : Codable {
    let rovers : [RoverModel]
}
struct RoverModel : Codable, Identifiable {
    let id : Int
    let name : String
    let launch_date : String
    let landing_date : String
    let status : String
}



