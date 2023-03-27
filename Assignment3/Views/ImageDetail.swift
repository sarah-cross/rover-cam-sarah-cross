//
//  ImageDetail.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/19/23.
//

import SwiftUI

struct ImageDetail: View {
    
    var url : String
    var date : String
    var sol : Int
    var camera : String
    @StateObject var favoritevm = FavoriteViewModel()
    @State var favorite = FavoriteModel(url: "")
    @State private var isFavorited = false
    
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(camera)")
                    .padding()
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.black.opacity(0.8))
                    .foregroundColor(.white)
                AsyncImage(url: URL(string: url)) {
                    image in image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    ProgressView()
                }
                HStack {
                    Text("Photo taken on:\nEarth date \(date)\nMartian sol day \(sol)")
                    Spacer()
                    Button(action: {
                        if isFavorited == false {
                            favorite.url = url
                            favoritevm.saveData(favorite: favorite)
                            isFavorited.toggle()
                        }
                        else {
                            favoritevm.removeData(favorite: favorite)
                            isFavorited.toggle()
                        }
                    }, label: {
                        Image(systemName: isFavorited ? "star.fill" : "star").font(.headline)
                        
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

struct ImageDetail_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetail(url: "https://mars.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/03773/opgs/edr/fcam/FRB_732455449EDR_F1001168FHAZ00337M_.JPG", date: "image detail", sol: 1, camera: "Front Hazard Avoidance Camera")
    }
}
