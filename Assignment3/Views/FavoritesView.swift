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
        var favoriteArray = Array(favoriteImages)
        
        ScrollView {
            VStack {
                ForEach(favoriteArray, id: \.self) { favorite in
                    ZStack (alignment: .bottomTrailing) {
                        AsyncImage(url: URL(string: favorite)){
                            image in image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                            
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Button {
                            if let index = favoriteArray.firstIndex(of: favorite) {
                                favoriteArray.remove(at: index)

                            }
                            
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(.white)
                                .padding(10)
                        }
                    }
                    
                    
                }
                
                
            }
            .navigationTitle("Favorites")
        }
        
    }
    
    
}

/*struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}*/
