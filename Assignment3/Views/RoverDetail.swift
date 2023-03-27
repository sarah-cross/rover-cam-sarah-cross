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
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10) {
                InfoView(launch: "Launch Date: \(rover.launch_date)", land: "Landing Date: \(rover.landing_date)", status: "Status: \(rover.status.capitalizingFirstLetter())")
                Spacer()
                Text("Latest Photos:")
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(imagevm.imageData.prefix(20)) {image in
                        if image.camera.rover_id == rover.id {
                                //ImageView(url: image.img_src)
                            NavigationLink(destination: ImageDetail(url: image.img_src, date: image.earth_date, sol: image.sol, camera: image.camera.full_name)) {
                                ImageView(url: image.img_src)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
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


// from: https://www.hackingwithswift.com/example-code/strings/how-to-capitalize-the-first-letter-of-a-string
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
