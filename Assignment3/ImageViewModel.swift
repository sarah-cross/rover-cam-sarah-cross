//
//  ImageViewModel.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/15/23.
//

import Foundation

class ImageViewModel : ObservableObject {
    
    @Published private(set) var imageData = [ImageModel]()
           
    func fetchData(rover_name : String) {
         
        if let url = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/\(rover_name)/latest_photos?api_key=2Ec7UNEXsLozhY0bp5Poyz8yAZQ6ciP08Qpkf9c0") {
            URLSession
                .shared
                .dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let data = data {
                            do {
                                let results = try JSONDecoder().decode(ImageResults.self, from: data)
                                DispatchQueue.main.async {
                                    self.imageData = results.latest_photos
                                }
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

