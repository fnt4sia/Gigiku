//
//  OnboardingPage.swift
//  GigiKu
//
//  Created by MacBook Air on 15/05/24.
//

import SwiftUI

struct OnboardingPage: View {
    var image = [
        "board1",
        "board2",
        "board3",
        "board4"
    ]
    var text = [
        "Penting untuk menjaga kesehatan gigi dan mulut Anda dengan melakukan pengecekan rutin. Pengecekan gigi secara berkala dapat membantu mendeteksi masalah sejak dini, mencegah kerusakan yang lebih parah, dan memastikan Anda selalu memiliki senyum yang sehat. Kami akan mengingatkan Anda untuk jadwal kunjungan berikutnya.",
        "Menjaga makanan juga baik lho untuk kesehatan Gigi, jangan terlalu banyak makan makanan manis ya!",
        "Penting untuk menjaga kesehatan gigi dan mulut Anda dengan melakukan pengecekan rutin. Pengecekan gigi secara berkala dapat membantu mendeteksi masalah sejak dini, mencegah kerusakan yang lebih parah, dan memastikan Anda selalu memiliki senyum yang sehat. Kami akan mengingatkan Anda untuk jadwal kunjungan berikutnya.",
        "Penting untuk menjaga kesehatan gigi dan mulut Anda dengan melakukan pengecekan rutin. Pengecekan gigi secara berkala dapat membantu mendeteksi masalah sejak dini, mencegah kerusakan yang lebih parah, dan memastikan Anda selalu memiliki senyum yang sehat."
    ]
    @State var currentImage = 0
    var body: some View {
        NavigationStack {
            VStack (spacing: 10){
                Image(image[currentImage])
                    .frame(maxWidth: UIScreen.main.bounds.width - 200)
                    .onTapGesture {
                        if currentImage < image.count - 1  {
                            currentImage += 1
                        }
                    }
                sliderIndicator(currentImage: currentImage)
                Text(text[currentImage])
                    .font(.system(size: 16))
                    .kerning(1)
                    .foregroundColor(.cyan)
                    .padding(.vertical, 20)
                    .multilineTextAlignment(.leading)
                Spacer()
                if(currentImage < 3) {
                    Text("Selanjutnya")
                        .font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width - 60)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(.cyan)
                        .cornerRadius(16)
                        .padding(.vertical, 30)
                        .opacity(0)
                } else {
                    NavigationLink (destination: CharacterCreate()) {
                        Text("Selanjutnya")
                            .font(.system(size: 20))
                            .frame(width: UIScreen.main.bounds.width - 60)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(.cyan)
                            .cornerRadius(16)
                            .padding(.vertical, 30)
                    }
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 100)
            .padding(.vertical, 60)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width > 50 {
                            if currentImage > 0 {
                                currentImage -= 1
                            }
                        } else if value.translation.width < -50 {
                            if currentImage < image.count - 1  {
                                currentImage += 1
                            }
                        }
                    }
            )
            .animation(.easeOut(duration: 0.3), value: currentImage)
        }
    }
}

private struct sliderIndicator: View {
    var currentImage : Int
    init(currentImage : Int) {
        self.currentImage = currentImage
    }
    var body: some View {
        HStack (spacing: 5){
            ForEach(0..<4, id: \.self) { index in
                ZStack{
                    
                }
                .frame(width: currentImage == index ? 80 : 20, height: 6)
                .background(.blue)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    OnboardingPage()
}
