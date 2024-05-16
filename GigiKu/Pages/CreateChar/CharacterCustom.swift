//
//  CharacterCustom.swift
//  GigiKu
//
//  Created by MacBook Air on 15/05/24.
//

import SwiftUI

struct CharacterCustom: View {
    @State var sheetAppear = true
    var nameChar : String
    var imageChar : String
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack (spacing: 5){
                    Text("Buat Karakter")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.gray)
                    Text(nameChar)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.cyan)
                    Image(imageChar)
                }
                CustomSheet(nameChar: nameChar, imageChar: imageChar)
                    .offset(y: UIScreen.main.bounds.height * 0.45)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
            .background(.white)
        }
    }
}

private struct CustomSheet: View {
    @State var baseCategory = "Penampilan"
    
    var nameChar : String
    var imageChar : String
    
    var penampilanList = [
        "Warna Kulit",
        "Rambut",
        "Alis",
        "Mata",
        "Hidung",
        "Telinga"
    ]
    
    @State var statePenampilan = 0
    
    @State var isActive : Bool = false
    
    var body: some View {
        VStack(spacing: 20){
            HStack {
                ZStack {
                    Text("Penampilan")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(baseCategory == "Penampilan" ? .cyan : .gray)
                    if(baseCategory == "Penampilan") {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.blue)
                            .offset(y: 12)
                    }
                }
                .onTapGesture {
                    baseCategory = "Penampilan"
                }
                ZStack {
                    Text("Aksesoris")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(baseCategory == "Aksesoris" ? .cyan : .gray)
                    if(baseCategory == "Aksesoris") {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.blue)
                            .offset(y: 12)
                    }
                }
                .onTapGesture {
                    baseCategory = "Aksesoris"
                }
            }

            VStack {
                if(baseCategory == "Penampilan") {
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack (spacing: 5){
                            ForEach(penampilanList.indices, id: \.self) { index in
                                ZStack {
                                    Text(penampilanList[index])
                                        .padding(.horizontal, 22)
                                        .padding(.vertical, 5)
                                        .foregroundColor(index == statePenampilan ? .white : .gray)
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .background(index == statePenampilan ? .cyan : .clear)
                                .cornerRadius(20)
                                .onTapGesture {
                                    statePenampilan = index
                                    print(index)
                                }

                            }
                        }
                        .padding(.horizontal, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    ScrollView (.vertical, showsIndicators: false) {
                        VStack(spacing : 20) {
                            if(statePenampilan == 0) {
                                Image("ColorList")
                                Image("ColorList-2")
                                Image("ColorList-1")
                            }else if(statePenampilan == 1) {
                                Image("ColorList")
                                Image("hair")
                            }
                        }

                    }
                }else {
                    ScrollView (.vertical, showsIndicators: false) {
                        Image("cloth")
                    }
                }

            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.25, alignment: .top)

            Text("Buat")
                .font(.system(size: 20))
                .frame(width: UIScreen.main.bounds.width - 60)
                .foregroundColor(.white)
                .padding(10)
                .background(Color.cyan)
                .cornerRadius(16)
                .onTapGesture {
                    if(!isActive) {
                        let character: [String: String] = [
                            "gender": imageChar,
                            "name": nameChar
                        ]
                        var initialCharacter: [Any] = UserDefaults.standard.array(forKey: "character") ?? []
                        initialCharacter.append(character)
                        UserDefaults.standard.set(initialCharacter, forKey: "character")
                        
                        isActive = true
                    }
                }
                .navigationDestination(isPresented: $isActive) {
                    ContentView()
                    Text("a")
                        .hidden()
                }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6, alignment: .top)
        .background(.white)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    CharacterCustom(nameChar: "preview", imageChar: "malechar")
}
