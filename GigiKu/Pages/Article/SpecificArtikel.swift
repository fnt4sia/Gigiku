import SwiftUI

struct SpecificArtikel: View {
    
    var body: some View {
        ZStack {
            Image("spesifik1")
                .resizable()
                .frame(height: UIScreen.main.bounds.height * 0.3)
                .offset(y: -UIScreen.main.bounds.height * 0.2)
            ScrollView (.vertical, showsIndicators: false){
                VStack (spacing: 5){
                    Text("Ketahui Cara Mengatasi Gigi Sakit Berlubang")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .font(.system(size: 24, weight: .bold))
                    Text("22 April 2024")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                    Text("Ditinjau oleh dr. Rizal Fardi")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                    ZStack {
                        Text("Kesehatan Gigi")
                            .padding(.horizontal, 22)
                            .padding(.vertical, 5)
                            .foregroundColor(.white)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .background(.cyan)
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 10)

                    Text("Masalah gigi berlubang sebenarnya bukan cuma terjadi pada anak-anak. Faktanya, keluhan ini pun juga dialami dari segala kalangan, mulai anak-anak, remaja, dewasa, hingga lansia.Jangan main-main dengan gigi berlubang, karena masalah ini bisa menimbulkan nyeri atau gigi ngilu yang mungkin tidak tertahankan. Selain itu, dalam beberapa kasus juga bisa mengakibatkan komplikasi, mulai dari infeksi, abses gigi, sepsis, hingga gigi tanggal.Gigi berlubang bisa menimbulkan berbagai gejala yang tidak nyaman yang muncul, seperti nyeri, bengkak, gigi ngilu dan gejala lainnya.Namun, dokter gigi bisa mengobati masalah kesehatan tersebut, sehingga gejala-gejala tidak nyaman pun otomatis akan mereda.")
                        .kerning(0.5)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
            }
            .padding(25)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7, alignment: .topLeading)
            .background(.white)
            .offset(y: UIScreen.main.bounds.height * 0.3)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topLeading)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    SpecificArtikel()
}
