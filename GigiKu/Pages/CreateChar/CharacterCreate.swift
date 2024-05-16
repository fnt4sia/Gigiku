//
//  CharacterCreate.swift
//  GigiKu
//
//  Created by MacBook Air on 15/05/24.
//

import SwiftUI

struct CharacterCreate: View {
    var image = [
        "malechar",
        "femalechar"
    ]
    @State var currentImage = 0
    @State var name = "Ubah Nama"
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Buat Karakter")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.gray)
                    TextField("Ubah Nama", text: $name)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.cyan)

                }
                Spacer()
                ZStack {
                    Image(image[currentImage % 2])
                    Image(systemName: "arrow.right")
                        .offset(x : 150)
                        .onTapGesture {
                            currentImage = currentImage + 1
                        }
                    Image(systemName: "arrow.left")
                        .offset(x : -150)
                        .onTapGesture {
                            currentImage = currentImage + 1
                        }
                }
                Spacer()
                NavigationLink (destination: CharacterCustom(nameChar: name, imageChar: image[currentImage % 2])){
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
            .padding(20)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    CharacterCreate()
}
