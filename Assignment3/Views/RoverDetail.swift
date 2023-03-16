//
//  RoverDetail.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/15/23.
//

import SwiftUI

struct RoverDetail: View {
   
    var rover : RoverModel
    @ObservedObject var imagevm = ImageViewModel()
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10) {
                Text(rover.name)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                InfoView(launch: "Launch Date: \(rover.launch_date)", land: "Landing Date: \(rover.landing_date)", status: "Status: \(rover.status)")
                Text("Latest Photos:")
                    .padding(.horizontal)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(imagevm.imageData.prefix(10)) {image in
                        if image.camera.rover_id == rover.id {
                                ImageView(url: image.img_src)
                                
                            }
                            
                                        
                    }
                    
                }
               
                
            }
            .padding()
        }
        .onAppear {
            imagevm.fetchData(rover_name: rover.name)
        }
    }
}

/*struct RoverDetail_Previews: PreviewProvider {
    static var previews: some View {
        RoverDetail(photo: ImageModel(img_src: "https://mars.nasa.gov/mer/gallery/all/2/p/2208/2P322473707ESFB27MP2600L8M1-BR.JPG"), rover: RoverModel(from: <#Decoder#>))
    }
} */
