//
//  FavoriteViewModel.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/27/23.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    
    @Published var favorites = [ImageModel]()
    let defaults = UserDefaults.standard
    
    
    func getFavorites() {
        let decoder = JSONDecoder()
        if let data = defaults.value(forKey: "Favorites") as? Data {
            let favoriteData = try? decoder.decode([ImageModel].self, from: data)
            self.favorites = favoriteData ?? []
        } else {
            self.favorites = []
        }
    }
    
    func remove(image: ImageModel) {
        let index = self.favorites.firstIndex(where: {$0.id == image.id})!
        self.favorites.remove(at: index)
        save()
    }
    
    func add(image: ImageModel) {
        self.favorites.append(image)
        save()
    }
    
    func contains(image: ImageModel) -> Bool {
        return self.favorites.contains(where: {$0.id == image.id})
    }
    
    
    func save() {
        if let encoded = try? JSONEncoder().encode(favorites) {
            defaults.set(encoded, forKey: "Favorites")
        }
    }
}
