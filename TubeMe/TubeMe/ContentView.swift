//
//  ContentView.swift
//  TubeMe
//
//  Created by Cédric Bahirwe on 29/01/2021.
//

import SwiftUI
class SessionManager: NSObject {
    
}

struct ContentView: View {
//    var data = MainClass()
    
    
    var body: some View {
        NavigationView {
            CustomViewController()//.environmentObject(data)
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct CustomViewController: UIViewControllerRepresentable {
//    @Binding hasLoggedIn: Bool = false
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: "ViewController")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
