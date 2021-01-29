//
//  Home.swift
//  TubeMe
//
//  Created by Cédric Bahirwe on 29/01/2021.
//

import SwiftUI
import GoogleAPIClientForREST


struct Home: View {
    @ObservedObject var data: MainClass

    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
            Text("Hello, World \(data.counter)!")
                .font(.largeTitle)
                .foregroundColor(.white)

        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
