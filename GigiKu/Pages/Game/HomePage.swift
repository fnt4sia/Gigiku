//
//  HomePage.swift
//  GigiKu
//
//  Created by MacBook Air on 08/05/24.
//

import SwiftUI

class CharacterManager: ObservableObject {
    @Published var image: [String] = []
    @Published var name: [String] = []
    @Published var coin: Int = 0

    init() {
        if let characterData = UserDefaults.standard.array(forKey: "character") as? [[String: String]] {
            for character in characterData {
                if let name = character["name"], let _ = character["gender"] {
                    self.name.append(name)
                    self.image.append("mainchar")
                }
            }
        }
        
        let coinData = UserDefaults.standard.integer(forKey: "coin")
        coin = coinData

        self.name.append("dummy")
        self.image.append("create")
    }
}


struct HomePage: View {
    
    @StateObject private var characterManager = CharacterManager()
    @State var currentImage = 0
    
    var body: some View {
        VStack (spacing: 10){
            NavBar(coin: characterManager.coin)
            CharacterChoose(currentImage: $currentImage, image: characterManager.image, name: characterManager.name)
            ChangeButton(currentImage: $currentImage, image: characterManager.image)
                .padding(.bottom, 35)
            DailyTrack()
            NavigationLink (destination: PrepPage()){
                StartButton()
                    .padding(.vertical, 35)
            }

        }
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .topLeading)
    }
}

private struct NavBar: View {
    
    var coin : Int
    
    var body: some View {
        ZStack{
            Text("Selamat Datang")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.gray)
            HStack (alignment: .center, spacing: 0){
                Text("\(coin) poin")
                    .font(.system(size: 20))
                    .foregroundColor(.cyan)
                Spacer()
            }
            .padding(.horizontal, 30)
        }
        
    }
}

private struct CharacterChoose: View {
    @Binding var currentImage : Int
    var image : [String]
    var name : [String]
    
    @State var isAnimate = false
    @State var randomInt = Int.random(in: 1..<11)
    
    var body: some View {
        VStack (spacing: 15){
            Text(name[currentImage])
                .font(.system(size: 32, weight: .semibold, design: .rounded))
                .kerning(1)
                .foregroundColor(currentImage == image.count - 1 ? .clear : .cyan)
            ZStack {
                if(currentImage < image.count - 1 && !isAnimate){
                    HStack (spacing: 1){
                        Text("Geser")
                        Image(systemName: "chevron.right")
                    }
                    .font(.system(size: 10))
                    .offset(x: UIScreen.main.bounds.width * 0.36)
                    .foregroundColor(.gray)
                }
                if(currentImage > 0 && !isAnimate) {
                    HStack (spacing: 1){
                        Image(systemName: "chevron.left")
                        Text("Geser")
                    }
                    .font(.system(size: 10))
                    .offset(x: -UIScreen.main.bounds.width * 0.36)
                    .foregroundColor(.gray)
                }
                if(!isAnimate && randomInt % 2 == 0 && currentImage != image.count - 1) {
                    Image("bubble")
                        .offset(x: -UIScreen.main.bounds.width * 0.175, y: 40)
                        .zIndex(19)
                }


                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 0){
                        ForEach(image.indices, id: \.self) { index in
                            ZStack {
                                if(index == image.count - 1) {
                                    NavigationLink(destination: CharacterCreate()) {
                                        Image(image[index])
                                            .frame(width: UIScreen.main.bounds.width * 0.64)
                                            .scaleEffect(currentImage == index ? 1.1 : 0.8)
                                            .onTapGesture {
                                                if (currentImage < index && !isAnimate){
                                                    isAnimate = true
                                                    currentImage = currentImage + 1
                                                }
                                                else if (currentImage > index && !isAnimate){
                                                    isAnimate = true
                                                    currentImage = currentImage - 1
                                                }
                                                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { timer in
                                                    isAnimate = false
                                                    randomInt = Int.random(in: 1..<11)
                                                }
                                            }
                                    }
                                } else {
                                    Image(image[index])
                                        .frame(width: UIScreen.main.bounds.width * 0.64)
                                        .scaleEffect(currentImage == index ? 1.1 : 0.8)
                                        .onTapGesture {
                                            if (currentImage < index && !isAnimate){
                                                isAnimate = true
                                                currentImage = currentImage + 1
                                            }
                                            else if (currentImage > index && !isAnimate){
                                                isAnimate = true
                                                currentImage = currentImage - 1
                                            }
                                            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { timer in
                                                isAnimate = false
                                                randomInt = Int.random(in: 1..<11)
                                            }
                                        }
                                }

                            }
                            .frame(width: UIScreen.main.bounds.width * 0.64)
                        }
                    }
                    .animation(.easeOut(duration: 0.3), value: currentImage)
                    .offset(x: UIScreen.main.bounds.width * (CGFloat(currentImage) * (-0.64) + 0.18))
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                if value.translation.width > 50 {
                                    if currentImage > 0 && !isAnimate {
                                        isAnimate = true
                                        currentImage -= 1
                                    }
                                } else if value.translation.width < -50 {

                                    if currentImage < image.count - 1 && !isAnimate {
                                        isAnimate = true
                                        currentImage += 1
                                    }
                                }
                                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { timer in
                                    isAnimate = false
                                    randomInt = Int.random(in: 1..<11)
                                }
                            }
                    )
                }
                .scrollDisabled(true)
            }
        }
    }
}

private struct ChangeButton: View {
    @Binding var currentImage : Int
    var image : [String]
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "wand.and.stars")
                Text("Ubah")
            }
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
        }
        .background(.cyan)
        .cornerRadius(16)
        .opacity(currentImage == image.count - 1 ? 0 : 1)
    }
}

private struct LinkCard: View {
    let title: String
    let color: Color
    let image: String
    
    init(title: String, color: Color, image: String) {
        self.title = title
        self.color = color
        self.image = image
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(title)
                    .font(.system(size: 24))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .kerning(1)
                Spacer()
                Button ( action : {
                    print("Hello World")
                }) {
                    Text("Lihat")
                        .font(.system(size: 13))
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
                .background(.white)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .cornerRadius(16)

            }
            .padding()
            Spacer()
            Image(image)
        }
        .frame(width: 350, height: 125)
        .background(color)
        .cornerRadius(25)
    }
}

private struct DailyTrack: View {
    var body: some View {
        VStack (spacing: 15){
            HStack {
                Text("Catatan Harian")
                    .font(.system(size: 20, weight: .medium))
                Spacer()
                HStack {
                    Text("Lihat Laporan")
                        .font(.system(size: 16, weight: .light))
                    Image(systemName: "arrow.right")
                }
            }
            .foregroundColor(.cyan)
            HStack {
                ForEach(1...7, id: \.self) { index in
                    VStack {
                        Text("\(index)")
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text("Min")
                    }
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.gray)
                    if (index != 7) {
                        Spacer()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 20)
    }
}

private struct StartButton: View {
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "play.fill")
                Text("Mulai Bermain")
            }
            .foregroundColor(.white)
            .padding()
        }
        .background(.cyan)
        .cornerRadius(16)
    }
}

#Preview {
    HomePage()
}
