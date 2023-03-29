//
//  Favorites.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/27/23.
//

import SwiftUI

struct Favorites: View {
    
    var favorites : [FavoriteModel]
    
    var body: some View {
        ScrollView {
            ForEach(favorites) { favorite in
                AsyncImage(url: URL(string: favorite.img_src)) {
                    image in image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .navigationTitle("Favorites")
        
    }
}

/*struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}*/
