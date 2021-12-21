//
//  LoadingView.swift
//  iTunesRSSGen
//
//  Created by Szabolcs Tóth on 2021. 12. 21..
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.green.opacity(0.1)
                .ignoresSafeArea()
            
            HStack {
                Image(systemName: "stopwatch")
                    .foregroundColor(.green)
                    .font(.title.bold())
                Text("Loading....")
                    .font(.title.bold())
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
