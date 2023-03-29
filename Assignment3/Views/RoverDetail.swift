//
//  RoverDetail.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/15/23.
//

import SwiftUI

struct RoverDetail: View {
   
    var rover : RoverModel
    @StateObject var imagevm = ImageViewModel()
    @State var isFavorited = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Latest Photos").font(.headline)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(imagevm.imageData.prefix(20)) {image in
                        if image.camera.rover_id == rover.id {
                            NavigationLink(destination: ImageDetail(image: image, isFavorited: $isFavorited)) { ImageView(url: image.img_src)}
                        }
                    }
                
                    
                }
            
               
                
            }
            .padding(.horizontal, 20)
            .navigationTitle(rover.name)
            
        }
        .onAppear {
            imagevm.fetchData(rover_name: rover.name)
           
        }
    }


}
