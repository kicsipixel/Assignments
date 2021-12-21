//
//  ErrorView.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import SwiftUI

struct ErrorView: View {
    
    let message: String
    
    var body: some View {
        ZStack {
            Color.red.opacity(0.1)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Image(systemName: "exclamationmark.octagon")
                        .foregroundColor(.red)
                        .font(.title.bold())
                    Text("ERROR happened.")
                        .font(.title.bold())
                }
                Text("\(message)")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Unknown error...")
    }
}
