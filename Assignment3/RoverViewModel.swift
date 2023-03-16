//
//  RoversViewModel.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/15/23.
//

import Foundation

class RoverViewModel : ObservableObject {
    
    @Published private(set) var roverData = [RoverModel]()
    private let url = "https://api.nasa.gov/mars-photos/api/v1/rovers?api_key=2Ec7UNEXsLozhY0bp5Poyz8yAZQ6ciP08Qpkf9c0"
    
    func fetchData() {
        if let url = URL(string: url) {
            URLSession
                .shared
                .dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let data = data {
                            do {
                                let results = try JSONDecoder().decode(RoverResults.self, from: data)
                                self.roverData = results.rovers
                            }
                            catch {
                                print(error)
                            }
                        }
                    }
                }.resume()
        }
    }
}
