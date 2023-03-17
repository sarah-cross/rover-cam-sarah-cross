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
                Text(rover.name)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                InfoView(launch: "Launch Date: \(rover.launch_date)", land: "Landing Date: \(rover.landing_date)", status: "Status: \(rover.status.capitalizingFirstLetter())")
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


// from: https://www.hackingwithswift.com/example-code/strings/how-to-capitalize-the-first-letter-of-a-string
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
