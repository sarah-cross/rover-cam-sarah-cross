//
//  Favorites.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/27/23.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favorites : FavoriteViewModel
    
    var body: some View {
        let favoriteImages: Set<String> = self.favorites.getFavorites()
        let favoriteArray = Array(favoriteImages)

        ScrollView {
            VStack {
                ForEach(favoriteArray, id: \.self) { favorite in
                    
                    AsyncImage(url: URL(string: favorite)){
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    } placeholder: {
                        ProgressView()
                    }
                }
                
            }
        }
        
    }
}

/*struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}*/
