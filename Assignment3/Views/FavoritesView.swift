//
//  Favorites.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/27/23.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favorites : FavoriteViewModel
    @State var refresh: Bool = false
    
    var body: some View {
        
        var favoriteImages: Set<String> = self.favorites.getFavorites()
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
                            favoriteArray.removeAll(where: {$0 == favorite})
                            print("This is after removing a favorite from the array: \(favoriteArray)")
                            
                            // printing the array shows that the image is being removed from the array
                            // but it is not updated in the favorites view model
                            // printing here shows nothing happened
                            // Array needs to be turned back into userDefault data?
                            
                            favoriteImages = self.favorites.getFavorites()
                            favoriteArray = Array(favoriteImages)
                            print("This is after calling getFavorites: \(favoriteArray)")
                            update()
                            
                            
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
    
    func update() {
        refresh.toggle()
    }
    
}

/*struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}*/
