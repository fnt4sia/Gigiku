//
//  PrepPage.swift
//  GigiKu
//
//  Created by MacBook Air on 14/05/24.
//

import SwiftUI

struct PrepPage: View {
    var image = [
        "bg1",
        "bg2",
        "bg3",
        "bg4"
    ]
    
    @State var currentImage : Int = 0
    var body: some View {
        VStack (spacing: 0){
            ZStack {
                Image(image[currentImage % image.count])
                Image("malechar")
                    .scaleEffect(0.6)
                    .offset(y: 50)
                    .mask(Image(image[currentImage % image.count]))
                Image("bubbleprev")
                    .offset(x: -50, y: 50)
            }
            VStack {
                HStack (spacing: 0){
                    Spacer()
                    Image("music")
                    Image("background")
                        .onTapGesture {
                            currentImage = currentImage + 1
                        }
                    Spacer()
                }
                NavigationLink (destination: GamePage(backgroundImage: image[currentImage % image.count])){
                    Image("start")
                }
            }
            .offset(y : -50)
        }
        .navigationTitle("Preview")
        .animation(.easeInOut(duration: 0.3), value: currentImage)
    }
}

#Preview {
    PrepPage()
}
