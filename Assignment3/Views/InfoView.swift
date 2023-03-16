//
//  InfoView.swift
//  Assignment3
//
//  Created by Sarah Cross on 3/15/23.
//

import SwiftUI

struct InfoView: View {
    
    var launch : String
    var land : String
    var status : String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(launch)
            Text(land)
            Text(status)
        }
        .padding()
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(launch: "Launch Date: ", land: "Landing Date: ", status: "Status: ")
    }
}
