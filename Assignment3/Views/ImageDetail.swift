//
//  ImageDetail.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/19/23.
//

import SwiftUI

struct ImageDetail: View {
    
    var image : ImageModel
    var rover : RoverModel
    @EnvironmentObject var favorites : FavoriteViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .trailing){
                    Text("\(rover.name)\n\(image.camera.full_name)")
                        .padding()
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                   
                    ShareLink(item: image.img_src) { Label("", systemImage:  "square.and.arrow.up").font(.headline)}
                            .foregroundColor(.white)
                            .padding(10)                }
                AsyncImage(url: URL(string: image.img_src)) {
                    image in image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    ProgressView()
                }
                HStack {
                    Text("Photo taken on:\nEarth date \(image.earth_date)\nMartian sol day \(image.sol)")
                    Spacer()
                    Button(action: {
                        if favorites.contains(image: image) {
                            favorites.remove(image: image)
                        }
                        else {
                            favorites.add(image: image)
                        }
                    }, label: {
                        ZStack {                            
                            Image(systemName: favorites.contains(image: image) ? "star.fill" : "star").font(.headline)

                        }
                        
                    })
                    
                                              
                    
                }
                .padding()
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black.opacity(0.8))
                .foregroundColor(.white)
                
            }
            .padding(.top)
            .padding(.bottom)
            
        }
    }
    
}
