//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct Rovers: View {
    
    @ObservedObject var rovervm = RoverViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(rovervm.roverData) { rover in
                NavigationLink {
                    RoverDetail(rover: rover)
                } label: {
                    Text(rover.name)
                }
                }
            }
            .onAppear {
                rovervm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Mars Rovers")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Rovers()
    }
}
