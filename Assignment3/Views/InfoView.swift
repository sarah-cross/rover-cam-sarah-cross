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
        }.padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.orange.opacity(0.6))
            .foregroundColor(.white)
            .cornerRadius(10)
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(launch: "Launch Date: ", land: "Landing Date: ", status: "Status: ")
    }
}

