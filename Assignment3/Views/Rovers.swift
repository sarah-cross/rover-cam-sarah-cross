//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct Rovers: View {
    
    @ObservedObject var rovervm = RoverViewModel()
    @StateObject var favorites = FavoriteViewModel()

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(rovervm.roverData) { rover in
                    NavigationLink {
                        RoverDetail(rover: rover)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(rover.name)
                                    .font(.title)
                                Text(rover.status)
                                
                            }
                            
                                
                                                                
                        }
                        .padding(40)
                        
                        .background(
                            Image("\(rover.name)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .overlay(Color.black).opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .onAppear {
                rovervm.fetchData()
                
            }
            .listStyle(.grouped)
            .navigationTitle("Mars Rovers")
            .navigationBarItems(trailing: Button(action: {}, label: {
                NavigationLink(destination: FavoritesView()) {
                    Text("Favorites")
                }
            }))
            
        }
        .environmentObject(favorites)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Rovers()
    }
}
