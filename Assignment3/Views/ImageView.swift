//
//  ImageCardView.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/15/23.
//

import SwiftUI

struct ImageView: View {
    
    var image : ImageModel
    @EnvironmentObject var favorites : FavoriteViewModel
    
    var body: some View {
        
        if favorites.contains(image: image) {
            AsyncImage(url: URL(string: image.img_src)) {
                image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 170)
                    .cornerRadius(10)
                    .clipped()
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 170, height: 170)
            .overlay(starOverlay, alignment: .bottomTrailing)
        }
        else {
            AsyncImage(url: URL(string: image.img_src)) {
                image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 170)
                    .cornerRadius(10)
                    .clipped()
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 170, height: 170)
        }
        
        
    }
    
    private var starOverlay: some View {
        Image(systemName: "star.fill")
            .foregroundColor(.white)
            .padding(10)
    }
    
    
}


