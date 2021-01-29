//
//  Home.swift
//  TubeMe
//
//  Created by Cédric Bahirwe on 29/01/2021.
//

import SwiftUI
//import GoogleAPIClientForREST


struct Home: View {
    @ObservedObject var data: MainClass
    
    let fgColor = Color("mainColor")
    
    var profileImage: Image {
        if  data.profile?.hasImage ?? false {
            if let img = data.profile?.imageURL(withDimension: 60) {
                let imgData = NSData(contentsOf: img)
                let uiimage = UIImage(data: imgData! as Data)
                if let image = uiimage {
                    return Image(uiImage: image)
                } else {
                   return Image(systemName: "person.crop.circle.fill")
                }
            }
        }
        return  Image(systemName: "person.crop.circle.fill")
    }

    var body: some View {
        VStack {
            HStack {
                profileImage
                    .resizable()
                    .frame(width: 60, height: 60)
                    .background(Color.black)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(data.profile?.name ?? "XXX XXX")
                    Text("Email: \(data.profile?.email ?? "XXXXXX")")
                }
                Spacer()
            }
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading) {
                    HStack {
                        VStack {
                            Image(systemName: "play.rectangle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40,height: 30)
                                .foregroundColor(fgColor)
                            Text("My Videos")
                                .font(.system(size: 20, design: .rounded))
                            
                        }
                        .foregroundColor(.black)
                        .frame(width: 150, height: 100)
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        Spacer()
                        VStack {
                            Image(systemName: "music.note.list")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40,height: 30)
                                .foregroundColor(fgColor)
                            Text("My playlists")
                                .font(.system(size: 20, design: .rounded))
                            
                        }
                        .foregroundColor(.black)
                        .frame(width: 150, height: 100)
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    
                    if let scopes = data.user?.grantedScopes as? [String], scopes.count > 0 {
                        ForEach(scopes, id: \.self) {scope in
                            Text(scope.capitalized)
                        }
                    }
                }
            }
            

        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(data: MainClass())
    }
}
