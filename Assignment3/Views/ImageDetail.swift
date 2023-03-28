//
//  ImageDetail.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/19/23.
//

import SwiftUI

struct ImageDetail: View {
    
    var image : ImageModel
    @StateObject var favoritevm = FavoriteViewModel()
    @State var favorite = FavoriteModel(id: "", img_src: "")
    //@State private var isFavorited = false
    @EnvironmentObject var settings: FavoriteSettings
    
    var body: some View {
        
        
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(image.camera.full_name)")
                    .padding()
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.black.opacity(0.8))
                    .foregroundColor(.white)
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
                        favorite.id = String(image.id)
                        favorite.img_src = image.img_src
                        if settings.isFavorited == false {
                            favoritevm.saveData(favorite: favorite)
                            settings.isFavorited.toggle()
                        }
                        else {
                            favoritevm.removeData(favorite: favorite)
                            settings.isFavorited.toggle()
                        }
                    }, label: {
                        Image(systemName: settings.isFavorited ? "star.fill" : "star").font(.headline)
                        
                    })
                    
                                              
                    
                }
                .padding()
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black.opacity(0.8))
                .foregroundColor(.white)
                
            }
            .padding(.top)
            .padding(.bottom)
            
        }
    }
    
}

/*struct ImageDetail_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetail(url: "https://mars.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/03773/opgs/edr/fcam/FRB_732455449EDR_F1001168FHAZ00337M_.JPG", date: "image detail", sol: 1, camera: "Front Hazard Avoidance Camera")
    }
} */
