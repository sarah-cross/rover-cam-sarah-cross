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
                    
                    // Stack of top caption, image, bottom caption
                    VStack(alignment: .leading, spacing: 0) {
                        
                        // Caption above image
                        HStack {
                            Text("\(favorite.camera.full_name)")
                            Spacer()
                            ShareLink(item: favorite.img_src) { Label("", systemImage:  "square.and.arrow.up")}
                                .foregroundColor(.white)
                                .font(.headline)
                                
                        }
                        .padding()
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        
                        
                        // Display image
                        AsyncImage(url: URL(string: favorite.img_src)) {
                            image in image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        } placeholder: {
                            ProgressView()
                        }
                        
                        // Caption under image
                        HStack {
                            Text("Photo taken on:\nEarth date \(favorite.earth_date)\nMartian sol day \(favorite.sol)")
                            Spacer()
                            Button {
                                favorites.remove(image: favorite)
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .padding(.trailing, 8)
                                   
                            }
                        }
                        .padding()
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
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
