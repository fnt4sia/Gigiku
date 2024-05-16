//
//  ScorePage.swift
//  GigiKu
//
//  Created by MacBook Air on 14/05/24.
//

import SwiftUI

struct ScorePage: View {
    var image = [
        "skor1",
        "skor2",
        "skor3"
    ]
    
    var text = [
        "Kamu sudah menyelesaikan misi hari ini, semangat aya tetap jaga kebersihan gigimu setaip hari",
        "Jangan lupa makna buah dan sayur supaya badanmu sehat dan bugar",
        "Jangan lupa sikat gigi kalo sudah selesai makan yang manis manis yaa!!"
    ]
    
    var color = [
        Color.green,
        Color.blue,
        Color.orange
    ]
    
    var icon = [
        "scope",
        "bitcoinsign.circle"
    ]
    
    var desc = [
        "Akurasi",
        "Poin"
    ]
    
    var randomScore = [
        Int.random(in: 85...100),
        Int.random(in: 800...1000)
    ]
    
    
    @State var currentState = 0
    @State var isActive : Bool = false
    
    var body: some View {
        VStack (spacing : 10){
            Image(image[currentState])
            Text("Hebatt!!!")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.orange)
            Text(text[currentState])
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .foregroundColor(.cyan)
            HStack {
                ForEach(0..<2, id: \.self) { index in
                    VStack (spacing: 5){
                        Text(desc[index])
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                        HStack (spacing: 0){
                            Image(systemName: icon[index])
                            if(index == 0) {
                                Text("\(randomScore[index])%")
                            }else{
                                Text("\(randomScore[index])")
                            }
 
                        }
                        .padding(12)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(color[index])
                        .background(.white)
                        .cornerRadius(20)
                    }
                    .padding(6)
                    .background(color[index])
                    .cornerRadius(20)
                    .navigationBarBackButtonHidden()
                    .opacity(currentState >= index  ? 1 : 0)
                }
            }
            if(currentState > 1){
                Text("Selanjutnya")
                    .font(.system(size: 20))
                    .frame(width: UIScreen.main.bounds.width - 60)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(.cyan)
                    .cornerRadius(16)
                    .onTapGesture {
                        UserDefaults.standard.setValue(randomScore[0], forKey: "accuracy")
                        UserDefaults.standard.setValue(randomScore[1], forKey: "coin")
                        
                        isActive = true
                    }
                    .navigationDestination(isPresented: $isActive) {
                        ContentView()
                        Text("a")
                            .hidden()
                    }
            }
        }
        .padding(.horizontal, 30)
        .onTapGesture {
            if(currentState < 2) {
                withAnimation {
                    currentState += 1
                }
            }
        }
        .navigationBarBackButtonHidden()
        .animation(.easeOut(duration: 0.5), value: currentState)
    }
}
private struct CalendarScore: View {
    
    var day = [
        "Sen",
        "Sel",
        "Rab",
        "Kam",
        "Jum",
        "Sab",
        "Min",
    ]
    
    var body: some View {
        VStack {
            Image("skor4")
            VStack (spacing: 10) {
                HStack {
                    ForEach(0...6, id: \.self) { index in
                        VStack {
                            Text(day[index])
                            if(index == 3) {
                                Image("done")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                            }else{
                                Image(systemName: "circle")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                            }
                        }
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(.gray)
                        if (index != 7) {
                            Spacer()
                        }
                    }
                }
                Rectangle()
                    .frame(height: 0.4)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                Text("Hati hati yaa runtutan mu akan reset lho jika tidak gosok gigi besok, Hati hati ya!")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.cyan)
                    .font(.system(size: 16))
            }
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 0.3)
            )
            NavigationLink (destination: BonusScore()){
                Text("Selanjutnya")
                    .font(.system(size: 20))
                    .frame(width: UIScreen.main.bounds.width - 60)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(.cyan)
                    .cornerRadius(16)
            }
            .padding(.vertical, 20)
        }
        .padding(.horizontal, 30)
        .navigationBarBackButtonHidden()
    }
}

private struct BonusScore: View {
    var body: some View {
        VStack {
            Image("bonus")
            Text("Kamu dapat poin tambahan!!!")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.orange)
                .multilineTextAlignment(.center)
            HStack (spacing: 0){
                Text("Gandakan poin - mu selama ")
                    .foregroundColor(.cyan)
                Text("7 hari ke depan")
                    .foregroundColor(.orange)
            }
            NavigationLink (destination: ContentView()){
                Text("Selanjutnya")
                    .font(.system(size: 20))
                    .frame(width: UIScreen.main.bounds.width - 60)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(.cyan)
                    .cornerRadius(16)

            }
            .padding(.vertical, 20)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ScorePage()
}
