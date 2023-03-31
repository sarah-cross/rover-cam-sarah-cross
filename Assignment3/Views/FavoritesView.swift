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
        ScrollView {
            VStack {
                ForEach(favorites.favorites) { favorite in
                    ZStack (alignment: .bottomTrailing) {
                        AsyncImage(url: URL(string: favorite.img_src)){
                            image in image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        Button {
                            favorites.remove(image: favorite)
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(.white)
                                .padding(10)
                        }
                        
                    }
                }
            }
            .navigationTitle("Favorites")
            .onAppear {
                favorites.getFavorites()
            }
        }
    }
    
}
